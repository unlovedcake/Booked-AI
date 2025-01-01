import 'package:booked_ai/firebase_options.dart';
import 'package:booked_ai/utils/router.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:booked_ai/views/deals/deals.dart';
import 'package:booked_ai/views/explore/explore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

final currentPageProvider = StateProvider<String>((ref) => '/explore');

// GoRouter configuration
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: ref.read(currentPageProvider),
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
    redirect: (context, state) {
      ref.read(currentPageProvider.notifier).state = state.matchedLocation;

      print('state.matchedLocation ${state.matchedLocation}');

      return null;
    },
  );
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setPathUrlStrategy(); // Enable clean URLs

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final goRouter = ref.watch(appRouter);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'Book AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
      // routerDelegate: goRouter.routerDelegate,
      // routeInformationParser: goRouter.routeInformationParser,
      // routeInformationProvider: goRouter.routeInformationProvider,
    );
  }
}
