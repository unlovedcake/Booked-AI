import 'package:booked_ai/models/deals_model.dart';
import 'package:booked_ai/repositories/deals_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final exploreNavBarTitleProvider = StateProvider<List<Map<String, String>>>((ref) {
//   return [
//     {'title': 'Explore', 'isHovering': 'Yes'},
//     {'title': 'Deals', 'isHovering': 'No'},
//     {'title': 'Blog', 'isHovering': 'No'},
//     {'title': 'Partner with Us', 'isHovering': 'No'},
//     {'title': 'About', 'isHovering': 'No'},
//   ];
// });

// final isHoveringTheNavBar = StateProvider<String>((ref) {
//   return 'Explore';
// });

// final currentIndexNavBar = StateProvider<int>((ref) {
//   return 0;
// });

// final currentIndexSocialMedia = StateProvider<int?>((ref) {
//   return null;
// });

// Riverpod provider for the MenuToggleNotifier
// final menuToggleProvider = StateNotifierProvider<MenuToggleNotifier, bool>((ref) => MenuToggleNotifier());

// class MenuToggleNotifier extends StateNotifier<bool> {
//   MenuToggleNotifier() : super(false);

//   void toggleMenu() => state = !state;
// }

class DealsViewModelNotifier extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final DealsRepository _repository;

  List<DealsModel> _deals = [];
  List<DealsModel> get deals => _deals;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isScrollingUp = false;
  bool hasReachedTop = true;

  double initialScrollOffset = 0.0;

  ScrollController? scrollController;

  ScrollController get controller => scrollController!;

  DealsViewModelNotifier(this._repository) {
    //addDeal();
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
      _deals = await _repository.fetchDeals();
    } catch (e) {
      _errorMessage = 'Failed to load deals: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addDeal() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _firestore.collection('deals').add({
        'title': 'Cheapest Flights to Dubai',
        'description':
            'Explore Dubai with travel AI deals on cheap flights. Save more on your next adventure using an AI travel agent.',
        'createdAt': DateTime.now(),
        'dealsDetails': [
          {
            'from': 'New York',
            'to': 'Dubai',
            'name': 'Emirates',
            'type': 'Economy Round Trip',
            'price': 799,
            'dateAvailable': DateTime.now(),
          },
          {
            'from': 'Doha',
            'to': 'Dubai',
            'name': 'Emirates',
            'type': 'Economy Round Trip',
            'price': 179,
            'dateAvailable': DateTime.now(),
          }
        ],
      });

      print('Deal Added Successfully');

      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to add deal: $e';
      notifyListeners();
    } finally {
      _isLoading = false;
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

final dealsRepositoryProvider = Provider<DealsRepository>((ref) {
  return DealsRepository();
});

// Define the provider for DealsViewModelNotifier
final dealsViewModelProvider = ChangeNotifierProvider<DealsViewModelNotifier>((ref) {
  final repository = ref.read(dealsRepositoryProvider);

  return DealsViewModelNotifier(repository);
});
