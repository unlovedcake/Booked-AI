import 'package:booked_ai/views/deals/deals.dart';
import 'package:booked_ai/views/explore/explore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/explore',
      builder: (context, state) => ExploreView(),
    ),
    GoRoute(
      path: '/deals',
      builder: (context, state) => const DealsView(),
    ),
  ],
  initialLocation: '/explore',
);
