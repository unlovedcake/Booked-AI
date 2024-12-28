import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exploreNavBarTitleProvider = StateProvider<List<Map<String, String>>>((ref) {
  return [
    {'title': 'Explore', 'isHovering': 'Yes'},
    {'title': 'Deals', 'isHovering': 'No'},
    {'title': 'Blog', 'isHovering': 'No'},
    {'title': 'Partner with Us', 'isHovering': 'No'},
    {'title': 'About', 'isHovering': 'No'},
  ];
});

final isHoveringTheNavBar = StateProvider<String>((ref) {
  return 'Explore';
});

final currentIndexNavBar = StateProvider<int>((ref) {
  return 0;
});

final currentIndexSocialMedia = StateProvider<int?>((ref) {
  return null;
});

class ExploreViewModelNotifier extends ChangeNotifier {
  ScrollController scrollController = ScrollController();

  bool isScrollingUp = false;
  bool hasReachedTop = true;
  bool isToggleMenu = false;

  ScrollController get controller => scrollController;

  ExploreViewModelNotifier() {
    scrollController.addListener(_onScroll);
  }

  void disposeController() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void toggleMenu() {
    isToggleMenu = !isToggleMenu;
    notifyListeners();
  }

  void _onScroll() {
    // Detect scrolling direction
    if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // User is scrolling up
      isScrollingUp = false;
    } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // User is scrolling down
      isScrollingUp = false;
    }

    // Detect if the user has reached the top edge
    if (scrollController.position.pixels == 0) {
      hasReachedTop = true; // At the top
    } else {
      hasReachedTop = false; // Not at the top
    }

    notifyListeners();
  }
}

// Define the provider for ExploreViewModelNotifier
final exploreViewModelNotifier = ChangeNotifierProvider<ExploreViewModelNotifier>((ref) {
  return ExploreViewModelNotifier();
});
