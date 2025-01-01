import 'dart:async';

import 'package:booked_ai/models/blog_model.dart';
import 'package:booked_ai/models/deals_model.dart';
import 'package:booked_ai/repositories/blog_repository.dart';
import 'package:booked_ai/repositories/deals_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final whosIsItForProvider = StateProvider<List<Map<String, String>>>((ref) {
  return [
    {
      'image': 'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675575a91ab8ab84c7747c00_image.png',
      'labelButton': 'Apply now',
      'title': 'Traditional / Online Travel Agents and DMOs',
      'description':
          'Streamline bookings, enhance customer support, and provide personalized travel solutions to attract and retain clients with intelligent, 24/7 AI-powered assistance.'
    },
    {
      'image': 'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675575aa459d4f94fde194c2_image.png',
      'labelButton': 'Apply now',
      'title': 'Tours, Hotels, Airlines and Cruises',
      'description':
          'Elevate the travel experience with seamless automation, personalized recommendations, and efficient operations tailored to meet diverse customer needs across the industry.'
    },
    {
      'image': 'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675575ab5686aca7553b2775_image.png',
      'labelButton': 'Coming soon',
      'title': 'Travel Influencers and Digital Nomads',
      'description':
          'Simplify trip planning, optimize content monetization, and provide instant travel assistance to keep creators focused on inspiring their audiences.'
    },
  ];
});

class PartnerWithUsViewModelNotifier extends ChangeNotifier {
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

  PartnerWithUsViewModelNotifier(this._repository) {
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

// Define the provider for PartnerWithUsViewModelNotifier
final partnerWithUsViewModelProvider = ChangeNotifierProvider<PartnerWithUsViewModelNotifier>((ref) {
  final repository = ref.read(dealsRepositoryProvider);

  return PartnerWithUsViewModelNotifier(repository);
});

final scrollControllerProvider = Provider<ScrollController>((ref) {
  return ScrollController();
});

// Timer Provider

// Timer Provider for continuous scrolling
final autoScrollProvider = Provider<Timer?>((ref) {
  ScrollController controller = ref.read(scrollControllerProvider);

  return Timer.periodic(Duration(milliseconds: 16), (timer) {
    if (controller.hasClients) {
      double maxScroll = controller.position.maxScrollExtent;

      if (controller.offset >= maxScroll) {
        controller.jumpTo(0); // Seamlessly jump to the start without a glitch
      } else {
        controller.jumpTo(controller.offset + 10.0); // Scroll by 2 pixels
      }
    }
  });
});
// final autoScrollProvider = Provider<Timer?>((ref) {
//   ScrollController controller = ref.read(scrollControllerProvider);

//   return Timer.periodic(Duration(milliseconds: 50), (timer) {
//     if (controller.hasClients) {
//       double maxScroll = controller.position.maxScrollExtent;
//       double currentScroll = controller.offset;

//       // Auto-scroll logic
//       if (currentScroll >= maxScroll) {
//         controller.jumpTo(0); // Reset to the beginning
//       } else {
//         controller.animateTo(
//           currentScroll + 10.0, // Scroll by 2 pixels
//           duration: Duration(milliseconds: 20),
//           curve: Curves.easeIn,
//         );
//       }
//     }
//   });
// });
