import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:booked_ai/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppLogoWidget extends ConsumerWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewMode = ref.watch(homeViewModelProvider);
    return InkWell(
      onTap: () {
        homeViewMode.scrolPos();
        ref.read(exploreViewModelProvider).setCurrentIndexNavBar(6);

        context.go('/');
      },
      child: SizedBox(
        height: 60,
        child: Image.network(
            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6711d4c2add268ab486ba5e2_Logo%20(7)-p-500.png'),
      ),
    );
  }
}
