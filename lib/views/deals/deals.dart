import 'package:booked_ai/main.dart';
import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/deals_view_model.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
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
import 'package:go_router/go_router.dart';

class DealsView extends ConsumerWidget {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print('Screen Width $sizeWidth');

    Uri currentUri = Uri.base; // Get the current URL
    String path = currentUri.path; // Get the path of the URL
    print('Current path: $path');

    final textTheme = Theme.of(context).textTheme;
    final scrollControllerNotifiers = ref.watch(dealsViewModelNotifier);
    final scrollController = scrollControllerNotifiers.controller;
    final isScrollingReachTheTop = scrollControllerNotifiers.hasReachedTop;

    final exploreController = ref.watch(exploreViewModelProvider);

    exploreController.setCurrentIndexNavBar(1);

    var isMenuOpen = scrollControllerNotifiers.isToggleMenu;

    final menuToggle = ref.read(dealsViewModelNotifier.notifier);

    Color containerColor = isScrollingReachTheTop ? Colors.transparent : Colors.white;

    // final urlPage = ref.watch(currentPageProvider);
    // final url = GoRouter.of(context).state!.matchedLocation;

    // if (url == '/deals') {
    //   ref.read(exploreViewModelNotifier).setCurrentIndexNavBar(1);
    // }

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
                      heightOfContainer: 535,
                      title: 'AI Travel Deals',
                      description: 'Latest AI travel deals for cheap flights, cheap hotels and more!',
                      widget: Container(
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
                                  labelText: 'Search...',
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
                                  'Search',
                                  style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                        offset: const Offset(0, -56),
                        child: Container(
                          height: 56,
                          width: sizeWidth * 0.83,
                          color: Colors.white,
                        )),
                    sizeWidth <= 1082
                        ? SizedBox(
                            width: sizeWidth < 850
                                ? sizeWidth
                                : sizeWidth < 1160
                                    ? sizeWidth * 0.89
                                    : sizeWidth * 0.83,
                            // color: Colors.red,
                            // margin: EdgeInsets.symmetric(
                            //     horizontal: sizeWidth < 768
                            //         ? 12
                            //         : sizeWidth > 768 && sizeWidth < 1328
                            //             ? 40
                            //             : 140),
                            child: Transform.translate(
                              offset: const Offset(0, -116),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 2, // Number of items in the list
                                itemBuilder: (context, index) {
                                  return ListViewDealsWidget(sizeWidth: sizeWidth, textTheme: textTheme);
                                },
                              ),
                            ),
                          )
                        : DealsListViewWidget(sizeWidth: sizeWidth, textTheme: textTheme),
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
                                    progress: isMenuOpen
                                        ? const AlwaysStoppedAnimation(1.0)
                                        : const AlwaysStoppedAnimation(0.0),
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

class ListViewDealsWidget extends StatelessWidget {
  const ListViewDealsWidget({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
  });

  final double sizeWidth;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 2,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                color: Colors.red,
                height: 320,
                child: Image.network(
                  'https://cdn.prod.website-files.com/6613f5a399757c17cec4c187/67333a645fb0800174306623_paris-cheap-flights.jpeg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cheapest Flights to Paris',
                    style: textTheme.bodyLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: sizeWidth * 0.4,
                    child: const Text(
                        maxLines: 4,
                        'Find the best AI-powered travel deals on cheap flights to Paris. Book now with your AI travel agent for unbeatable prices.'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: sizeWidth,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(sizeWidth, 50),
                            backgroundColor: AppColors.textSecondary, // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Border radius
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Get the app',
                            style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                          )))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DealsListWidgetMobile(sizeWidth: sizeWidth, textTheme: textTheme),
          const SizedBox(
            height: 20,
          ),
          DealsListWidgetMobile(sizeWidth: sizeWidth, textTheme: textTheme),
        ],
      ),
    );
  }
}

class DealsListViewWidget extends StatelessWidget {
  const DealsListViewWidget({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
  });

  final double sizeWidth;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth < 1160 ? sizeWidth * 0.89 : sizeWidth * 0.83,
      // color: Colors.red,
      // margin: EdgeInsets.symmetric(
      //     horizontal: sizeWidth < 768
      //         ? 12
      //         : sizeWidth > 768 && sizeWidth < 1328
      //             ? 40
      //             : 140),
      child: Transform.translate(
          offset: const Offset(0, -116),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2, // Number of items in the list
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                width: sizeWidth,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      offset: const Offset(0, 4),
                      blurRadius: 2, // Blur radius
                      spreadRadius: 0.2, // Spread radius
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Colors.red,
                              height: 320,
                              width: sizeWidth < 1160 ? sizeWidth * 0.28 : sizeWidth * 0.26,
                              child: Image.network(
                                'https://cdn.prod.website-files.com/6613f5a399757c17cec4c187/67333a645fb0800174306623_paris-cheap-flights.jpeg',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        DealsListWidget(sizeWidth: sizeWidth, textTheme: textTheme),
                        DealsListWidget(sizeWidth: sizeWidth, textTheme: textTheme),
                      ],
                    ),
                    Container(
                      width: sizeWidth * 0.25,
                      child: Text(
                        'Cheapest Flights to Paris',
                        style: textTheme.bodyLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: sizeWidth * 0.25,
                          child: const Text(
                              'Find the best AI-powered travel deals on cheap flights to Paris. Book now with your AI travel agent for unbeatable prices.'),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 50),
                              backgroundColor: AppColors.textSecondary, // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Border radius
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Get the app',
                              style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}

class DealsListWidget extends StatelessWidget {
  const DealsListWidget({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
  });

  final double sizeWidth;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                offset: const Offset(0, 4), // Horizontal and Vertical offset
                blurRadius: 4, // Blur radius
                spreadRadius: 2, // Spread radius
              ),
            ],
          ),
          height: 320,
          width: sizeWidth < 1160 ? sizeWidth * 0.28 : sizeWidth * 0.26,
          padding: const EdgeInsets.all(18),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary100,
                      borderRadius: BorderRadius.circular(20), // Border radius of 10
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Available until Feb 6',
                          style: textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: Text(
                        'On Sale',
                        style:
                            textTheme.bodyLarge?.copyWith(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                          child: Text(
                        'jetBlue',
                        style: textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          'Economy One Way',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FittedBox(child: Text('Jet Blue')),
                        const SizedBox(
                          width: 8,
                        ),
                        FittedBox(
                            child: Text(
                          'London to New York',
                          style: textTheme.bodyLarge
                              ?.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                        const FittedBox(child: Text('Per Person')),
                      ],
                    ),
                  ),
                  Container(alignment: Alignment.center, height: 40, child: const Text('Direct'))
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const FittedBox(child: Text('\$301 cheaper than usual')),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: const Text(
                        '\$600,',
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const FittedBox(
                        child: Row(
                      children: [
                        Text('Get deal in the App'),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.textSecondary,
                        )
                      ],
                    )),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: Row(
                        children: [
                          SvgPicture.network(
                            fit: BoxFit.cover,
                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6730b31557adfeb124b63470_tag.svg',
                          ),
                          Text(
                            '\$299,',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DealsListWidgetMobile extends StatelessWidget {
  const DealsListWidgetMobile({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
  });

  final double sizeWidth;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                offset: const Offset(0, 4), // Horizontal and Vertical offset
                blurRadius: 4, // Blur radius
                spreadRadius: 2, // Spread radius
              ),
            ],
          ),
          height: 320,
          padding: const EdgeInsets.all(18),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary100,
                      borderRadius: BorderRadius.circular(20), // Border radius of 10
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Available until Feb 6',
                          style: textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: Text(
                        'On Sale',
                        style:
                            textTheme.bodyLarge?.copyWith(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                          child: Text(
                        'jetBlue',
                        style: textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          'Economy One Way',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FittedBox(child: Text('Jet Blue')),
                        const SizedBox(
                          width: 8,
                        ),
                        FittedBox(
                            child: Text(
                          'London to New York',
                          style: textTheme.bodyLarge
                              ?.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                        const FittedBox(child: Text('Per Person')),
                      ],
                    ),
                  ),
                  Container(alignment: Alignment.center, height: 40, child: const Text('Direct'))
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const FittedBox(child: Text('\$301 cheaper than usual')),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: const Text(
                        '\$600,',
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const FittedBox(
                        child: Row(
                      children: [
                        Text('Get deal in the App'),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.textSecondary,
                        )
                      ],
                    )),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: Row(
                        children: [
                          SvgPicture.network(
                            fit: BoxFit.cover,
                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6730b31557adfeb124b63470_tag.svg',
                          ),
                          Text(
                            '\$299,',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}