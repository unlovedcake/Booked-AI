import 'package:booked_ai/models/blog_model.dart';
import 'package:booked_ai/models/deals_model.dart';
import 'package:booked_ai/repositories/blog_repository.dart';
import 'package:booked_ai/repositories/deals_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogViewModelNotifier extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final BlogRepository _repository;

  List<BlogModel> _blogs = [];
  List<BlogModel> get blogs => _blogs;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isScrollingUp = false;
  bool hasReachedTop = true;

  double initialScrollOffset = 0.0;

  ScrollController? scrollController;

  ScrollController get controller => scrollController!;

  BlogViewModelNotifier(this._repository) {
    fetchDeals();
    scrollController = ScrollController(initialScrollOffset: initialScrollOffset);
    scrollController!.addListener(_onScroll);
  }

  void disposeController() {
    scrollController!.removeListener(_onScroll);
    scrollController!.dispose();
    super.dispose();
  }

  // Fetch deals from Firestore
  Future<void> fetchDeals() async {
    print('Fetching Deals');
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _blogs = await _repository.fetchBlogs();
    } catch (e) {
      _errorMessage = 'Failed to load deals: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void scrolPos() {
    print('Deals Page');
    scrollController = ScrollController(initialScrollOffset: initialScrollOffset);
    scrollController!.addListener(_onScroll);
    notifyListeners();
  }

  void _onScroll() {
    if (scrollController!.position.userScrollDirection == ScrollDirection.forward) {
      // User is scrolling up
      isScrollingUp = false;
    } else if (scrollController!.position.userScrollDirection == ScrollDirection.reverse) {
      // User is scrolling down
      isScrollingUp = false;
    }

    // Detect if the user has reached the top edge
    if (scrollController!.position.pixels == 0) {
      hasReachedTop = true; // At the top
    } else {
      hasReachedTop = false; // Not at the top
    }

    initialScrollOffset = scrollController!.offset;

    notifyListeners();
  }
}

final dealsRepositoryProvider = Provider<BlogRepository>((ref) {
  return BlogRepository();
});

// Define the provider for BlogViewModelNotifier
final blogViewModelProvider = ChangeNotifierProvider<BlogViewModelNotifier>((ref) {
  final repository = ref.read(dealsRepositoryProvider);

  return BlogViewModelNotifier(repository);
});
