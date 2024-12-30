import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/views/explore/footer_widget.dart';
import 'package:booked_ai/views/explore/grid_view_widget.dart';
import 'package:booked_ai/views/explore/header_widget.dart';
import 'package:booked_ai/views/explore/holiday_deals_widget.dart';
import 'package:booked_ai/views/explore/menu_bar_widget.dart';
import 'package:booked_ai/views/explore/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../view_models/explore_view_model.dart';

class ExploreView extends ConsumerWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print('Screen Width $sizeWidth');
    Uri currentUri = Uri.base; // Get the current URL
    String path = currentUri.path; // Get the path of the URL
    print('Current path: $path');

    final textTheme = Theme.of(context).textTheme;
    final scrollControllerNotifiers = ref.watch(exploreViewModelNotifier);
    final scrollController = scrollControllerNotifiers.controller;
    final isScrollingReachTheTop = scrollControllerNotifiers.hasReachedTop;

    var isMenuOpen = scrollControllerNotifiers.isToggleMenu;

    scrollControllerNotifiers.setCurrentIndexNavBar(0);

    final menuToggle = ref.read(exploreViewModelNotifier.notifier);

    Color containerColor = isScrollingReachTheTop ? Colors.transparent : Colors.white;

    if (sizeWidth > 1126 && isMenuOpen) {
      isMenuOpen = false;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Scrollbar(
              controller: scrollController,
              trackVisibility: true,
              thumbVisibility: true,
              thickness: 12,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    HeaderWidget(
                      textTheme: textTheme,
                      heightOfContainer: 445,
                      title: 'Explore',
                      description: 'Learn about newest travel trends and amazing places to visit!',
                    ),
                    Transform.translate(
                        offset: const Offset(0, -56),
                        child: Container(
                          height: 56,
                          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 850 ? 15 : 145),
                          color: Colors.white,
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: sizeWidth < 768
                              ? 12
                              : sizeWidth > 768 && sizeWidth < 1328
                                  ? 40
                                  : 140),
                      child: Transform.translate(
                        offset: const Offset(0, -116),
                        child: GridViewWidget(
                          sizeWidth: sizeWidth,
                          textTheme: textTheme,
                          storageKey: 'explore',
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk2MC1uaW5nLTMwLmpwZw.jpg',
                          ),
                          fit: BoxFit.cover, // Adjust how the image is fitted
                        ),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        runAlignment: WrapAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 12),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sign up for our news letter',
                                    textAlign: TextAlign.start,
                                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 20)),
                                const Text('Be thee first to know about releases and industry news and insights',
                                    textAlign: TextAlign.start),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Wrap(
                              runSpacing: 12,
                              spacing: 10,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width < 850 ? double.infinity : 500,
                                  child: TextField(
                                    //onChanged: (value) => ref.read(emailProvider.notifier).state = value,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: 'Email',
                                      labelStyle: const TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.grey),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width < 850 ? double.infinity : 150,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Action for the Subscribe button
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.textSecondary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Subscribe',
                                      style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FooterWidget(textTheme: textTheme),
                  ],
                ),
              ),
            ),
            MenuBarWidget(isMenuOpen: isMenuOpen, textTheme: textTheme, sizeWidth: sizeWidth),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10),
                    color: AppColors.primary,
                    child: HolidayDealsWidget(textTheme: textTheme),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    margin: const EdgeInsets.only(right: 15),
                    height: 100,
                    color: containerColor,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width < 850
                              ? 12
                              : MediaQuery.of(context).size.width < 1210
                                  ? 100
                                  : 140),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 60,
                            child: Image.network(
                                'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6711d4c2add268ab486ba5e2_Logo%20(7)-p-500.png'),
                          ),
                          const Expanded(child: SizedBox()),
                          MediaQuery.of(context).size.width <= 1126
                              ? IconButton(
                                  icon: AnimatedIcon(
                                    icon: AnimatedIcons.menu_close,
                                    progress: isMenuOpen ? AlwaysStoppedAnimation(1.0) : AlwaysStoppedAnimation(0.0),
                                  ),
                                  onPressed: () => menuToggle.toggleMenu(),
                                )
                              : NavBarWidget(textTheme: textTheme),
                          const SizedBox(
                            width: 16,
                          ),
                          sizeWidth <= 1126
                              ? const SizedBox()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
