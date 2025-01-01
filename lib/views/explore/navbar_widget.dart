import 'package:booked_ai/main.dart';
import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/blog_view_model.dart';
import 'package:booked_ai/view_models/deals_view_model.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:booked_ai/view_models/partner_with_us_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
        //final _currentIndexNavBar = ref.watch(currentIndexNavBar);
        final exploreViewModel = ref.watch(exploreViewModelProvider);
        final dealsViewModel = ref.watch(dealsViewModelProvider);
        final blogViewModel = ref.watch(blogViewModelProvider);
        final partnerWithUsViewModel = ref.watch(partnerWithUsViewModelProvider);

        return InkWell(
          onHover: (isHovering) {
            if (isHovering) {
              ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[index]['isHovering'] = 'Yes';
            } else {
              ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[index]['isHovering'] = 'No';
            }
          },
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: exploreViewModel.currentIndexNavBar == index
                  ? Colors.transparent
                  : navBarTitles[index]['isHovering'] == 'Yes'
                      ? Colors.white10
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextButton(
                onPressed: () {
                  ref.read(exploreViewModelProvider).setCurrentIndexNavBar(index);
                  //ref.read(currentIndexNavBar.notifier).state = index;
                  ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[0]['isHovering'] = 'No';

                  switch (index) {
                    case 0:
                      exploreViewModel.scrolPos();

                      context.go('/explore');

                      break;
                    case 1:
                      dealsViewModel.scrolPos();

                      context.go('/deals');

                      break;

                    case 2:
                      blogViewModel.scrolPos();

                      context.go('/blog');

                      break;

                    case 3:
                      partnerWithUsViewModel.scrolPos();

                      context.go('/partner-with-us');

                      break;
                  }
                },
                child: Text(navBarTitles[index]['title'] ?? '',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: exploreViewModel.currentIndexNavBar == index || navBarTitles[index]['isHovering'] == 'Yes'
                          ? AppColors.textSecondary
                          : Colors.grey.shade600,
                    ))),
          ),
        );
      }),
    );

    // Wrap(
    //   alignment: WrapAlignment.center,
    //   crossAxisAlignment: WrapCrossAlignment.center,
    //   spacing: 10,
    //   children: List.generate(ref.watch(exploreNavBarTitleProvider).length, (index) {
    //     final navBarTitles = ref.watch(exploreNavBarTitleProvider);
    //     var hoveringValue = ref.watch(isHoveringTheNavBar);
    //     final _currentIndexNavBar = ref.watch(currentIndexNavBar);

    //     return InkWell(
    //       onHover: (isHovering) {
    //         if (isHovering) {
    //           ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[index]['isHovering'] = 'Yes';

    //           print('navBarTitles $navBarTitles');
    //         } else {
    //           ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[index]['isHovering'] = 'No';
    //           print('navBarTitles $navBarTitles');
    //         }
    //       },
    //       onTap: () {},
    //       child: AnimatedContainer(
    //         duration: const Duration(milliseconds: 300),
    //         decoration: BoxDecoration(
    //           color: _currentIndexNavBar == index
    //               ? Colors.transparent
    //               : navBarTitles[index]['isHovering'] == 'Yes'
    //                   ? Colors.white10
    //                   : Colors.transparent,
    //           borderRadius: BorderRadius.circular(20.0),
    //         ),
    //         child: TextButton(
    //             onPressed: () {
    //               ref.read(currentIndexNavBar.notifier).state = index;
    //               ref.read(isHoveringTheNavBar.notifier).state = navBarTitles[0]['isHovering'] = 'No';
    //             },
    //             child: Text(navBarTitles[index]['title'] ?? '',
    //                 style: textTheme.bodyLarge?.copyWith(
    //                   fontWeight: FontWeight.w400,
    //                   color: _currentIndexNavBar == index || navBarTitles[index]['isHovering'] == 'Yes'
    //                       ? AppColors.textSecondary
    //                       : Colors.grey.shade600,
    //                 ))),
    //       ),
    //     );
    //   }),
    // );
  }
}
