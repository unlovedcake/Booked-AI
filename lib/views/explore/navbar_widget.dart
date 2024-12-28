import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarWidget extends ConsumerWidget {
  const NavBarWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 30,
      children: List.generate(ref.watch(exploreNavBarTitleProvider).length, (index) {
        final navBarTitles = ref.watch(exploreNavBarTitleProvider);
        var hoveringValue = ref.watch(isHoveringTheNavBar);
        var _currentIndexNavBar = ref.watch(currentIndexNavBar);
        return InkWell(
          onHover: (isHovering) {
            if (isHovering) {
              ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[index]['isHovering'] = 'Yes';

              print('navBarTitles $navBarTitles');
            } else {
              ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[index]['isHovering'] = 'No';
              print('navBarTitles $navBarTitles');
            }
          },
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: _currentIndexNavBar == index
                  ? Colors.transparent
                  : navBarTitles[index]['isHovering'] == 'Yes'
                      ? Colors.white10
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextButton(
                onPressed: () {
                  ref.read(currentIndexNavBar.notifier).state = index;
                  ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[0]['isHovering'] = 'No';
                },
                child: Text(navBarTitles[index]['title'] ?? '',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: _currentIndexNavBar == index || navBarTitles[index]['isHovering'] == 'Yes'
                          ? AppColors.textSecondary
                          : Colors.grey.shade600,
                    ))),
          ),
        );
      }),
    );
  }
}