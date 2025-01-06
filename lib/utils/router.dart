import 'package:booked_ai/views/blog/blog.dart';
import 'package:booked_ai/views/deals/deals.dart';
import 'package:booked_ai/views/explore/explore.dart';
import 'package:booked_ai/views/home/home.dart';
import 'package:booked_ai/views/partner_with_us/partner_with_us.dart';

import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/explore',
      builder: (context, state) => const ExploreView(),
    ),
    GoRoute(
      path: '/deals',
      builder: (context, state) => const DealsView(),
    ),
    GoRoute(
      path: '/blog',
      builder: (context, state) => const BlogView(),
    ),
    GoRoute(
      path: '/partner-with-us',
      builder: (context, state) => const PartnerWithUsView(),
    ),
  ],
  initialLocation: '/',
);
