import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:html' as html;

// Define a provider to track back navigation
final backNavigationProvider = StateProvider<bool>((ref) => false);

class BackButtonNavigatorObserver extends NavigatorObserver {
  // final WidgetRef ref;

  // BackButtonNavigatorObserver(this.ref);

  final container = ProviderContainer();

  @override
  void didPop(Route route, Route? previousRoute) {
    print('BACKs');
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    // html.window.onPopState.listen((event) {
    //   final currentIndex = container.read(exploreViewModelNotifier.notifier);

    //   container.read(exploreViewModelNotifier.notifier).setCurrentIndexNavBar(currentIndex.currentIndexNavBar);
    //   print('CLICKED ${currentIndex.currentIndexNavBar}');
    // });

    // final currentIndex = container.read(currentIndexProvider.notifier).state;
    // if (currentIndex > 0) {
    //   container.read(currentIndexProvider.notifier).state = currentIndex - 1;
    // }
  }
}
