import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

final exploreNavBarTitleProvider = StateProvider<List<Map<String, String>>>((ref) {
  return [
    {'title': 'Explore', 'isHovering': 'No'},
    {'title': 'Deals', 'isHovering': 'No'},
    {'title': 'Blog', 'isHovering': 'No'},
    {'title': 'Partner with Us', 'isHovering': 'No'},
    {'title': 'About', 'isHovering': 'No'},
  ];
});

final isHoveringTheNavBar = StateProvider<String>((ref) {
  return 'Explore';
});

final currentIndexSocialMedia = StateProvider<int?>((ref) {
  return null;
});

class ExploreViewModelNotifier extends ChangeNotifier {
  bool isScrollingUp = false;
  bool hasReachedTop = true;
  bool isToggleMenu = false;

  double initialScrollOffset = 0.0;

  int _currentIndexNavBar = 0;

  int get currentIndexNavBar => _currentIndexNavBar;

  String currentUrl = '/explore';

  ScrollController? scrollController;
  ScrollController get controller => scrollController!;

  ExploreViewModelNotifier() {
    currentUrlPage();

    //currentIndex();

    scrollController = ScrollController(initialScrollOffset: initialScrollOffset);
    scrollController!.addListener(_onScroll);
  }

  void currentUrlPage() {
    Uri currentUri = Uri.base; // Get the current URL
    String path = currentUri.path; // Get the path of the URL
    print('Explore Page: $path');

    if (path == '/explore') {
      _currentIndexNavBar = 0;
    } else {
      _currentIndexNavBar = 1;
    }

    notifyListeners();
  }

  Future<void> currentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    _currentIndexNavBar = prefs.getInt('currentIndex') ?? 0;

    notifyListeners();
  }

  void disposeController() {
    scrollController!.removeListener(_onScroll);
    scrollController!.dispose();
    super.dispose();
  }

  void setCurrentIndexNavBar(int index) async {
    final prefs = await SharedPreferences.getInstance();
    _currentIndexNavBar = index;

    await prefs.setInt('currentIndex', index);

    notifyListeners();
  }

  void toggleMenu() {
    isToggleMenu = !isToggleMenu;
    notifyListeners();
  }

  void scrolPos() {
    scrollController = ScrollController(initialScrollOffset: initialScrollOffset);
    scrollController!.addListener(_onScroll);
    notifyListeners();
  }

  void _onScroll() {
    // Detect scrolling direction

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

    print('initialScrollOffset $initialScrollOffset');

    //scrolPos(position: initialScrollOffset);

    notifyListeners();
  }
}

// Define the provider for ExploreViewModelNotifier
final exploreViewModelNotifier = ChangeNotifierProvider<ExploreViewModelNotifier>((ref) {
  return ExploreViewModelNotifier();
});
