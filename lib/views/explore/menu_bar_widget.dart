import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/deals_view_model.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MenuBarWidget extends ConsumerWidget {
  const MenuBarWidget({
    super.key,
    required this.isMenuOpen,
    required this.textTheme,
    required this.sizeWidth,
  });

  final bool isMenuOpen;
  final TextTheme textTheme;
  final double sizeWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      color: Colors.white,
      margin: EdgeInsets.only(right: 15),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isMenuOpen ? 280 : 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              spacing: 10,
              children: List.generate(ref.watch(exploreNavBarTitleProvider).length, (index) {
                final navBarTitles = ref.watch(exploreNavBarTitleProvider);
                var hoveringValue = ref.watch(isHoveringTheNavBar);

                //final _currentIndexNavBar = ref.watch(currentIndexNavBar);
                final exploreViewModel = ref.watch(exploreViewModelProvider);
                final dealsViewModel = ref.watch(dealsViewModelProvider);

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
                              exploreViewModel.isToggleMenu = false;
                              dealsViewModel.scrolPos();
                              context.go('/explore');

                              break;
                            case 1:
                              exploreViewModel.scrolPos();
                              exploreViewModel.isToggleMenu = false;
                              context.go('/deals');

                              break;
                          }
                        },
                        child: Text(navBarTitles[index]['title'] ?? '',
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: exploreViewModel.currentIndexNavBar == index ||
                                      navBarTitles[index]['isHovering'] == 'Yes'
                                  ? AppColors.textSecondary
                                  : Colors.grey.shade600,
                            ))),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(sizeWidth * 0.9, 40),
                    backgroundColor: AppColors.textSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Get the BETA',
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
