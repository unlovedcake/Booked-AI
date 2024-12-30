import 'package:booked_ai/view_models/navigator_observer.dart';
import 'package:booked_ai/views/deals/deals.dart';
import 'package:booked_ai/views/explore/explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// final GoRouter appRouter = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/explore',
//       builder: (context, state) => ExploreView(),
//     ),
//     GoRoute(
//       path: '/deals',
//       builder: (context, state) => const DealsView(),
//     ),
//   ],
//   initialLocation: '/explore',

// );

final backNavigationProvider = StateProvider<bool>((ref) => false);

// GoRouter configuration
final appRouter = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/explore',
    observers: [
      BackButtonNavigatorObserver(), // Add the custom observer
    ],
    routes: [
      GoRoute(
        path: '/explore',
        builder: (context, state) => ExploreView(),
      ),
      GoRoute(
        path: '/deals',
        builder: (context, state) => DealsView(),
      ),
    ],
  );
});
