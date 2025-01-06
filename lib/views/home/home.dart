import 'package:booked_ai/main.dart';
import 'package:booked_ai/models/deals_model.dart';
import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/deals_view_model.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:booked_ai/view_models/home_view_model.dart';
import 'package:booked_ai/views/blog/blog_grid_view_widget.dart';
import 'package:booked_ai/views/explore/button_google_and_apple.dart';
import 'package:booked_ai/views/explore/footer_widget.dart';
import 'package:booked_ai/views/explore/grid_view_widget.dart';
import 'package:booked_ai/views/explore/header_widget.dart';
import 'package:booked_ai/views/explore/holiday_deals_widget.dart';
import 'package:booked_ai/views/explore/menu_bar_widget.dart';
import 'package:booked_ai/views/explore/navbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print('Screen Width $sizeWidth');

    final textTheme = Theme.of(context).textTheme;

    // final videoController = ref.watch(videoControllerProvider);
    final HomeViewModel = ref.watch(homeViewModelProvider);

    final scrollController = HomeViewModel.controller;
    final videoController = HomeViewModel.videoController;

    if (!videoController!.value.isPlaying) {
      videoController.play();
    }

    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (screenWidth >= 1282) {
      // Desktop
      crossAxisCount = 3;
    } else if (screenWidth >= 850) {
      // Tablet
      crossAxisCount = 2;
    } else {
      // Mobile
      crossAxisCount = 1;
    }

    final isScrollingReachTheTop = HomeViewModel.hasReachedTop;

    final exploreViewModel = ref.watch(exploreViewModelProvider);

    var isGetTheBeta = exploreViewModel.isToggleGetBeta;

    exploreViewModel.setCurrentIndexNavBar(6);

    var isMenuOpen = exploreViewModel.isToggleMenu;

    Color containerColor = isScrollingReachTheTop ? Colors.transparent : Colors.white;

    if (sizeWidth <= 1126 && isGetTheBeta) {
      isGetTheBeta = false;
    }
    if (sizeWidth > 1126 && isMenuOpen) {
      isMenuOpen = false;
    }

    print('Home Page');

    final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

    // Determine the number of columns based on screen width
    int columns;
    int gridViewColumn;
    if (screenWidth >= 1305) {
      // Desktop
      columns = 3;
    } else if (screenWidth >= 873) {
      // Tablet
      columns = 2;
    } else {
      // Mobile
      columns = 1;
    }

    final List<Widget> widgets = [
      Container(
        decoration: BoxDecoration(
          color: AppColors.primary50,
          border: Border.all(
            color: Colors.grey.shade600,
            width: 0.1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6634501f6b6462681e47645e_AI%20Bubble.png'),
                  const Center(child: Icon(Icons.microwave_sharp))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'Hands free voice to text technology',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      width: crossAxisCount == 3
                          ? sizeWidth * 0.3
                          : crossAxisCount == 2
                              ? sizeWidth * 0.4
                              : sizeWidth - 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Utilise our voice-to-text technology while on the move, or opt for our standard text input.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: AppColors.primary50,
          border: Border.all(
            color: Colors.grey.shade600,
            width: 0.1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.network(
              fit: BoxFit.cover,
              'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e114f03768e8365954af6_COnatiner.svg',
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'Clear and easy-to-understand itineraries',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      width: crossAxisCount == 3
                          ? sizeWidth * 0.3
                          : crossAxisCount == 2
                              ? sizeWidth * 0.4
                              : sizeWidth - 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Experience itineraries that are straightforward, intuitive, and designed for effortless interpretation on our advances platform.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: AppColors.primary50,
          border: Border.all(
            color: Colors.grey.shade600,
            width: 0.1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.network(
              fit: BoxFit.cover,
              'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66da8d6469f8157090862d88_bookedai-packages-image.svg',
            ),
            Container(
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'Custom travel packages, crafted just for you',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      width: crossAxisCount == 3
                          ? sizeWidth * 0.3
                          : crossAxisCount == 2
                              ? sizeWidth * 0.4
                              : sizeWidth - 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "We build the perfect travel package, tailored to your needs. We handle the heavy lifting, and you're free to make changes anytime.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FittedBox(
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'COMING SOON',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    final List<Widget> partnerWithBookAi = [
      Container(
        height: sizeHeight * 0.66,
        decoration: BoxDecoration(
          color: AppColors.primary50,
          border: Border.all(
            color: Colors.grey.shade600,
            width: 0.1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675670a01b306361a5a9d9f5_All%20in%20one%20solution%20illos-p-1600.png'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'An all-in-one solution to streamline your service',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      width: crossAxisCount == 3
                          ? sizeWidth * 0.3
                          : crossAxisCount == 2
                              ? sizeWidth * 0.4
                              : sizeWidth - 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Automate every step, reducing manual effort while achieving cost and time savings",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        height: crossAxisCount == 2 ? sizeHeight * 0.7 : sizeHeight * 0.68,
        decoration: BoxDecoration(
          color: AppColors.primary50,
          border: Border.all(
            color: Colors.grey.shade600,
            width: 0.1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675670e7b6abaf4005891658_Frame%201618872745-p-1600.png'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'A white-labelled solution for your business',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      width: crossAxisCount == 3
                          ? sizeWidth * 0.3
                          : crossAxisCount == 2
                              ? sizeWidth * 0.4
                              : sizeWidth - 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "White-labelled app with seamless website integration and around the clock support",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        height: sizeHeight * 0.66,
        decoration: BoxDecoration(
          color: AppColors.primary50,
          border: Border.all(
            color: Colors.grey.shade600,
            width: 0.1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675682b4f5aaaee2145856a9_cover%20image%20whole%204x-p-1600.png'),
            Container(
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'Keep up with the ongoing revolution',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      width: crossAxisCount == 3
                          ? sizeWidth * 0.3
                          : crossAxisCount == 2
                              ? sizeWidth * 0.4
                              : sizeWidth - 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "We are constantly adapting to the market, bringing out new features and surprises!",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    final images = [
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d6ebcbbca9d89ccd09_Card-5.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d62ec21edbea1675b6_Card-3.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d69b0f798c1708fcd9_Card-1.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d6ebcbbca9d89ccd09_Card-5.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d62ec21edbea1675b6_Card-3.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d69b0f798c1708fcd9_Card-1.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d6ebcbbca9d89ccd09_Card-5.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d62ec21edbea1675b6_Card-3.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/663082d69b0f798c1708fcd9_Card-1.png',
    ];

    final img = [
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e294bc25b14bc144a8468_Hilton%20Hotel.svg',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e294b015886e2759eccd3_Qualia.svg',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e294b015886e2759eccd3_Qualia.svg',
    ];

    if (screenWidth <= 1174) {
      gridViewColumn = 1;

      print('Grid $gridViewColumn');
    } else {
      gridViewColumn = 2;
      print('Grid $gridViewColumn');
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
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(right: 15),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk2MC1uaW5nLTMwLmpwZw.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              width: sizeWidth <= 850 ? sizeWidth : sizeWidth * 0.5,
                              child: Text(
                                'Your AI travel agent, right at your fingertips',
                                textScaler: const TextScaler.linear(1.2),
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge?.copyWith(
                                    height: 1.1, fontSize: sizeWidth <= 850 ? 30 : 50, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: sizeWidth <= 850 ? sizeWidth : sizeWidth * 0.46,
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Introducing the world's first AI Travel Agent! Booked AI manages your flights, hotels, and itineraries through an easy-to-use chat platform.",
                                textScaler: const TextScaler.linear(1.1),
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge
                                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey.shade700),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const ButtonGoogleAndApple(),
                            const SizedBox(
                              height: 30,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none, // Allows overflow
                              children: [
                                Positioned(
                                    left: -230, //-sizeWidth * 0.15, //-230,
                                    bottom: 0, // Move closer to left
                                    child: Image.asset(
                                      'assets/images/finger_thumbs.png',
                                      height: sizeHeight * 0.9,
                                      fit: BoxFit.cover,
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    print('TAP');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.grey.shade300, width: 4),
                                      color: Colors.black,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 15,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    width: 300,
                                    height: 600,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: HomeViewModel.isVideoInitializing
                                          ? AspectRatio(
                                              aspectRatio: videoController.value.aspectRatio,
                                              child: VideoPlayer(videoController),
                                            )
                                          : const Center(
                                              child: CircularProgressIndicator(),
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: sizeWidth >= 1600 ? -260 : -250,
                                    child: Image.asset(
                                      'assets/images/finger_tips.png',
                                      height: sizeHeight * 0.98,
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                          ],
                        )),

                    //Tablet or Mobile
                    // sizeWidth <= 1082
                    //     ? SizedBox(
                    //         width: sizeWidth < 850
                    //             ? sizeWidth
                    //             : sizeWidth < 1160
                    //                 ? sizeWidth * 0.89
                    //                 : sizeWidth * 0.83,
                    //         child: HomeViewModel.isLoading
                    //             ? const Center(child: CircularProgressIndicator())
                    //             : HomeViewModel.errorMessage != null
                    //                 ? Center(child: Text('Error: ${HomeViewModel.errorMessage}'))
                    //                 : ListViewDealsWidgetMobile(
                    //                     sizeWidth: sizeWidth, textTheme: textTheme, deals: HomeViewModel.deals),
                    //       )
                    //     :
                    //     // Desktop
                    //     HomeViewModel.isLoading
                    //         ? const Center(child: CircularProgressIndicator())
                    //         : HomeViewModel.errorMessage != null
                    //             ? Center(child: Text('Error: ${HomeViewModel.errorMessage}'))
                    //             : Container(
                    //                 width: sizeWidth * 0.85,
                    //                 child: LayoutBuilder(builder: (context, constraints) {
                    //                   int numberColumn = 3;

                    //                   if (sizeWidth <= 768) {
                    //                     numberColumn = 1;
                    //                   } else if (sizeWidth > 768 && sizeWidth <= 1336) {
                    //                     numberColumn = 2;
                    //                   } else {
                    //                     numberColumn = 3;
                    //                   }

                    //                   return GridView.builder(
                    //                     shrinkWrap: true,
                    //                     physics: const NeverScrollableScrollPhysics(),
                    //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //                       crossAxisCount: numberColumn,
                    //                       crossAxisSpacing: 20,
                    //                       mainAxisSpacing: 40,
                    //                       childAspectRatio: numberColumn == 3
                    //                           ? sizeWidth < 768
                    //                               ? 0.94
                    //                               : sizeWidth <= 1439
                    //                                   ? 0.5
                    //                                   : sizeWidth <= 1561
                    //                                       ? 0.55
                    //                                       : 0.6
                    //                           : sizeWidth <= 1134
                    //                               ? 0.56
                    //                               : 0.6,
                    //                     ),
                    //                     itemCount: HomeViewModel.deals.length, // Number of items in the list
                    //                     itemBuilder: (context, index) {
                    //                       final deal = HomeViewModel.deals[index];
                    //                       return Container(
                    //                         margin: EdgeInsets.only(top: 40),
                    //                         alignment: Alignment.topCenter,
                    //                         decoration: BoxDecoration(
                    //                           color: Colors.white,
                    //                           boxShadow: [
                    //                             BoxShadow(
                    //                               color: Colors.black.withOpacity(0.2),
                    //                               offset: const Offset(0, 4),
                    //                               blurRadius: 2,
                    //                               spreadRadius: 0.2,
                    //                             ),
                    //                           ],
                    //                         ),
                    //                         child: Column(
                    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                           children: [
                    //                             Padding(
                    //                               padding: const EdgeInsets.all(22.0),
                    //                               child: Column(
                    //                                 children: [
                    //                                   Container(
                    //                                     alignment: Alignment.topCenter,
                    //                                     child: CachedNetworkImage(
                    //                                       fit: BoxFit.cover,
                    //                                       imageUrl: deal.image,
                    //                                       placeholder: (context, url) =>
                    //                                           const Center(child: CircularProgressIndicator()),
                    //                                       errorWidget: (context, url, error) => Image.network(
                    //                                           'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                    //                                     ),
                    //                                   ),
                    //                                   Container(
                    //                                     width: sizeWidth,
                    //                                     child: Text(
                    //                                       deal.title,
                    //                                       style: textTheme.bodyLarge
                    //                                           ?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                             Expanded(
                    //                               child: Container(
                    //                                 padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    //                                 child: DealsListWidget(
                    //                                     sizeWidth: sizeWidth,
                    //                                     textTheme: textTheme,
                    //                                     dealsDetail: deal.dealsDetails[0]),
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       );
                    //                     },
                    //                   );
                    //                 }),
                    //               ),

                    const SizedBox(
                      height: 60,
                    ),

                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('Worldwide Flights & Hotels, Tailored just for you',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: sizeWidth * 0.5,
                      child: Text(
                          textAlign: TextAlign.center,
                          'Let our AI Travel Agent help you discover a world of personalised travel, with tailored options to match your unique preferences.',
                          style: textTheme.bodyLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: sizeWidth * 0.85,
                      height: sizeWidth > 850 ? sizeHeight * 0.7 : sizeHeight * 0.98,
                      // child: Column(
                      //   children: [
                      //     Container(
                      //       width: sizeWidth * 0.6,
                      //       child: Text('Worldwide Flights & Hotels, Tailored just for you',
                      //           textAlign: TextAlign.center,
                      //           style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                      //     ),
                      //     Container(
                      //       width: sizeWidth * 0.5,
                      //       child: Text(
                      //           textAlign: TextAlign.center,
                      //           'Let our AI Travel Agent help you discover a world of personalised travel, with tailored options to match your unique preferences.',
                      //           style: textTheme.bodyLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700)),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     GridView.builder(
                      //       physics: NeverScrollableScrollPhysics(),
                      //       shrinkWrap: true,
                      //       padding: const EdgeInsets.all(8.0),
                      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: gridViewColumn,
                      //           crossAxisSpacing: 20.0, // Space between columns
                      //           mainAxisSpacing: 20.0, // Space between rows
                      //           childAspectRatio: 1.1),
                      //       itemCount: 2, // Total number of items
                      //       itemBuilder: (context, index) {
                      //         return index == 0
                      //             ? Container(
                      //                 padding: EdgeInsets.only(bottom: 20),
                      //                 decoration: BoxDecoration(
                      //                   color: AppColors.primary50,
                      //                   border: Border.all(
                      //                     color: Colors.grey.shade600,
                      //                     width: 0.1,
                      //                   ),
                      //                 ),
                      //                 child: Stack(
                      //                   alignment: Alignment.center,
                      //                   children: [
                      //                     Container(
                      //                       margin: EdgeInsets.symmetric(vertical: 60),
                      //                       child: SvgPicture.network(
                      //                         fit: BoxFit.cover,
                      //                         'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e32f187d954a8525c2375_Recommendations%20screen.svg',
                      //                       ),
                      //                     ),
                      //                     Center(
                      //                       child: Container(
                      //                         height: 150,
                      //                         child: ScrollLoopAutoScroll(
                      //                             child: Row(
                      //                               children: [
                      //                                 MarqueImagesWidget(imageUrl: images[0]),
                      //                                 MarqueImagesWidget(imageUrl: images[1]),
                      //                                 MarqueImagesWidget(imageUrl: images[2]),
                      //                                 MarqueImagesWidget(imageUrl: images[0]),
                      //                                 MarqueImagesWidget(imageUrl: images[1]),
                      //                                 MarqueImagesWidget(imageUrl: images[2]),
                      //                                 MarqueImagesWidget(imageUrl: images[0]),
                      //                                 MarqueImagesWidget(imageUrl: images[1]),
                      //                                 MarqueImagesWidget(imageUrl: images[2]),
                      //                               ],
                      //                             ),
                      //                             scrollDirection: Axis.horizontal,
                      //                             delay: Duration(seconds: 1),
                      //                             duration: Duration(seconds: 40),
                      //                             reverseScroll: true,
                      //                             duplicateChild: 1,
                      //                             enableScrollInput: true,
                      //                             delayAfterScrollInput: Duration(seconds: 3)),
                      //                       ),
                      //                     ),
                      //                     Center(
                      //                       child: Column(
                      //                         mainAxisAlignment: MainAxisAlignment.end,
                      //                         children: [
                      //                           SizedBox(
                      //                             height: 40,
                      //                           ),
                      //                           Container(
                      //                             margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      //                             child: const Text(
                      //                               'Flights from 300+ Airlines - Instantly',
                      //                               style: TextStyle(
                      //                                 fontSize: 20,
                      //                                 fontWeight: FontWeight.bold,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Container(
                      //                             width: sizeWidth * 0.4,
                      //                             margin: EdgeInsets.symmetric(horizontal: 8),
                      //                             child: const Text(
                      //                               textAlign: TextAlign.center,
                      //                               'Our AI Travel Agent finds flights in seconds, from the cheapest to the quickest, offering cost-effective and convenient choices tailored to your needs.',
                      //                               style: TextStyle(fontSize: 16, color: Colors.grey),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             : Container(
                      //                 padding: EdgeInsets.only(bottom: 20),
                      //                 decoration: BoxDecoration(
                      //                   color: AppColors.primary50,
                      //                   border: Border.all(
                      //                     color: Colors.grey.shade600,
                      //                     width: 0.1,
                      //                   ),
                      //                 ),
                      //                 child: Stack(
                      //                   alignment: Alignment.center,
                      //                   children: [
                      //                     Container(
                      //                       margin: EdgeInsets.symmetric(vertical: 60),
                      //                       child: SvgPicture.network(
                      //                         fit: BoxFit.cover,
                      //                         'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e32f187d954a8525c2375_Recommendations%20screen.svg',
                      //                       ),
                      //                     ),
                      //                     Center(
                      //                       child: Container(
                      //                         height: 150,
                      //                         child: ScrollLoopAutoScroll(
                      //                             child: Row(
                      //                               children: [
                      //                                 MarqueImagesSVGWidget(imageUrl: img[0]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[1]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[2]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[0]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[1]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[2]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[0]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[1]),
                      //                                 MarqueImagesSVGWidget(imageUrl: img[2]),
                      //                               ],
                      //                             ),
                      //                             scrollDirection: Axis.horizontal,
                      //                             delay: Duration(seconds: 1),
                      //                             duration: Duration(seconds: 40),
                      //                             reverseScroll: true,
                      //                             duplicateChild: 1,
                      //                             enableScrollInput: true,
                      //                             delayAfterScrollInput: Duration(seconds: 3)),
                      //                       ),
                      //                     ),
                      //                     Center(
                      //                       child: Column(
                      //                         mainAxisAlignment: MainAxisAlignment.end,
                      //                         children: [
                      //                           Container(
                      //                             margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      //                             child: const Text(
                      //                               'Experience a collection of over 1,000 hotels',
                      //                               style: TextStyle(
                      //                                 fontSize: 20,
                      //                                 fontWeight: FontWeight.bold,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Container(
                      //                             width: sizeWidth * 0.3,
                      //                             margin: EdgeInsets.symmetric(horizontal: 8),
                      //                             child: const Text(
                      //                               textAlign: TextAlign.center,
                      //                               "We've collaborated with over 1,000 hotels worldwide, providing accommodation options catering to all budgets, from \$ to \$\$\$.",
                      //                               style: TextStyle(fontSize: 16, color: Colors.grey),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               );
                      //       },
                      //     ),
                      //   ],
                      // )

                      child: sizeWidth > 850
                          ? AnimateImages(images: images, sizeWidth: sizeWidth, screenWidth: screenWidth, img: img)
                          : AnimateImagesSVG(images: images, sizeWidth: sizeWidth, screenWidth: screenWidth, img: img),
                    ),

                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset('assets/images/circle.PNG')),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('AI designed to create the perfect travel journey',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: sizeWidth * 0.5,
                      child: Text(
                          textAlign: TextAlign.center,
                          "We've elevated AI by creating a product that functions as your around-the-clock personal travel assistant.",
                          style: textTheme.bodyLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: sizeWidth * 0.85,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(22),
                                child: Image.asset(
                                  'assets/images/chat.PNG',
                                  height: sizeHeight * 0.9,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Smart Travel Companion',
                                    style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Experience the future of travel planning with Booked AI. Our platform leverages advanced AI technology to streamline your journey, from initial search to final booking.',
                                    style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text(
                                              'Engage with our AI for tailored travel picks matching your tastes',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text('Build your bespoke itinerary through natural conversations',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(
                                          Icons.check,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text(
                                            'Pick up where you left off anytime for seamless trip planning',
                                            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: sizeWidth * 0.85,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wait times reduced by a factor of 10',
                                    style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Experience efficiency like never before with our AI Travel Agent – where wait times are reduced, ensuring swift and seamless service.',
                                    style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text('Flights booked in minutes',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text('Immediate display of hotels and flights',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(
                                          Icons.check,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text(
                                            'Live support throughout your journey',
                                            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(22),
                                child: Image.network(
                                  'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66e39ba46df7838345f10051_booked-ai-booking-image-p-800.png',
                                  height: sizeHeight * 0.6,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: sizeWidth * 0.85,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(22),
                                child: Image.network(
                                  'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66daa4e615b42608b37490e3_bookedai-support-image-p-800.png',
                                  height: sizeHeight * 0.6,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Live support at your fingertips 24/7',
                                    style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Speak with Booked AI 24/7 for any booking-related questions or assistance you may need during your journey.',
                                    style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text('Support and modifications related to your bookings.',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text('Cancellation of hotel stays and/or flights',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(
                                          Icons.check,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text(
                                            'Utilise the app for personalised itinerary suggestions and travel suggestions',
                                            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      width: sizeWidth * 0.6,
                      child: Text('Why use Booked AI',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: sizeWidth * 0.85,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            childAspectRatio: crossAxisCount == 1
                                ? 1
                                : crossAxisCount == 2 && sizeWidth <= 932
                                    ? 0.7
                                    : 0.88),
                        itemCount: widgets.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widgets[index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('Partner with Booked AI',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),

                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('Partner with us and an integrate an AI Travel in under 24 hours!',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.w700)),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: sizeWidth * 0.85,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                        ),
                        itemCount: partnerWithBookAi.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: partnerWithBookAi[index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('AI Travel Deals',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),

                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('Latest AI travel deals for cheap flights, cheap hotels and more!',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),

                    Container(
                      width: sizeWidth * 0.85,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (HomeViewModel.deals.length / columns).ceil(),
                        itemBuilder: (context, rowIndex) {
                          // Get items for the current row
                          List<Widget> rowItems = [];
                          for (int i = 0; i < columns; i++) {
                            int itemIndex = rowIndex * columns + i;

                            if (itemIndex < HomeViewModel.deals.length) {
                              rowItems.add(
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Card(
                                      color: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      elevation: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(22.0),

                                        alignment: Alignment.topCenter,
                                        // decoration: BoxDecoration(
                                        //   color: Colors.white,
                                        //   boxShadow: [
                                        //     BoxShadow(
                                        //       color: Colors.black.withOpacity(0.2),
                                        //       offset: const Offset(0, 4),
                                        //       blurRadius: 2,
                                        //       spreadRadius: 0.2,
                                        //     ),
                                        //   ],
                                        // ),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topCenter,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: HomeViewModel.deals[itemIndex].image,
                                                placeholder: (context, url) =>
                                                    const Center(child: CircularProgressIndicator()),
                                                errorWidget: (context, url, error) => Image.network(
                                                    'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(vertical: 20),
                                              width: sizeWidth,
                                              child: Text(
                                                HomeViewModel.deals[itemIndex].title,
                                                style: textTheme.bodyLarge
                                                    ?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            Column(
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
                                                              borderRadius:
                                                                  BorderRadius.circular(20), // Border radius of 10
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                const Icon(Icons.calendar_month),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Text(
                                                                  'Available until ${DateFormat('dd MMM').format(HomeViewModel.deals[itemIndex].dealsDetails[0].dateAvailable)}',
                                                                  style: textTheme.bodyLarge?.copyWith(
                                                                      color: Colors.black,
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w500),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                              alignment: Alignment.center,
                                                              height: 40,
                                                              child: Text(
                                                                'On Sale',
                                                                style: textTheme.bodyLarge?.copyWith(
                                                                    color: Colors.red,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.bold),
                                                              ))
                                                        ],
                                                      ),

                                                      //Deal Details
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 12),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: const EdgeInsets.all(8),
                                                              child: FittedBox(
                                                                  child: Text(
                                                                HomeViewModel.deals[itemIndex].dealsDetails[0].name,
                                                                style: textTheme.bodyLarge?.copyWith(
                                                                    color: Colors.blue,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.bold),
                                                              )),
                                                            ),
                                                            Container(
                                                                alignment: Alignment.center,
                                                                height: 40,
                                                                child: Text(
                                                                  HomeViewModel.deals[itemIndex].dealsDetails[0].type,
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
                                                                FittedBox(
                                                                    child: Text(
                                                                  HomeViewModel.deals[itemIndex].dealsDetails[0].name,
                                                                )),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                FittedBox(
                                                                    child: Text(
                                                                  '${HomeViewModel.deals[itemIndex].dealsDetails[0].from} to ${HomeViewModel.deals[itemIndex].dealsDetails[0].to}',
                                                                  style: textTheme.bodyLarge?.copyWith(
                                                                      color: Colors.black,
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                                const FittedBox(child: Text('Per Person')),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                              alignment: Alignment.center,
                                                              height: 40,
                                                              child: const Text('Direct'))
                                                        ],
                                                      ),
                                                      const Divider(),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            padding: const EdgeInsets.all(8),
                                                            child: FittedBox(
                                                                child: Text(
                                                              '\$${HomeViewModel.deals[itemIndex].dealsDetails[0].price}',
                                                            )),
                                                          ),
                                                          Stack(
                                                            alignment: Alignment.center,
                                                            children: [
                                                              Text('\$600',
                                                                  style: textTheme.bodyLarge
                                                                      ?.copyWith(color: Colors.grey.shade400)),
                                                              Container(
                                                                height: 1,
                                                                width: 40,
                                                                color: Colors.grey,
                                                              ),
                                                            ],
                                                          )
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
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    '\$${HomeViewModel.deals[itemIndex].dealsDetails[0].price}',
                                                                    style: textTheme.bodyLarge?.copyWith(
                                                                        fontSize: 22, fontWeight: FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              // Add a spacer for empty slots
                              rowItems.add(const Expanded(child: SizedBox.shrink()));
                            }
                          }

                          return Row(
                            children: rowItems,
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('Latest in AI Travel',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),

                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('Learn about the latest AI travel trends and amazing places to visit!',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: sizeWidth * 0.85,
                      child: BlogGridViewWidget(
                        sizeWidth: sizeWidth,
                        textTheme: textTheme,
                        storageKey: 'blog',
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('Discover Adventures',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),

                    Container(
                      width: sizeWidth * 0.6,
                      child: Text('The latest travel industry news, articles, videos and resources.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: sizeWidth * 0.85,
                      child: BlogGridViewWidget(
                        sizeWidth: sizeWidth,
                        textTheme: textTheme,
                        storageKey: 'blog',
                      ),
                    ),

                    Container(
                      width: sizeWidth,
                      color: AppColors.primary50,
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      child: Container(
                        width: sizeWidth * 0.75,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              width: sizeWidth * 0.6,
                              child: Text('Frequently Asked Questions',
                                  textAlign: TextAlign.center,
                                  style: textTheme.bodyLarge
                                      ?.copyWith(fontSize: sizeWidth <= 850 ? 30 : 40, fontWeight: FontWeight.bold)),
                            ),
                            buildExpansionTile(sizeWidth, 'What is Booked AI ?', [
                              'Booked is the world’s first AI Travel Agent that can book flights, accommodations, and soon, Ubers, restaurants, activities, and tours on your behalf. Our Travel Agent benefits off live data and advanced travel protocols to provide you with personalized travel options, making planning and booking trips as seamless as possible.',
                            ]),
                            buildExpansionTile(sizeWidth, 'How is Booked AI different from other travel platforms ?', [
                              "Unlike traditional online travel agencies that aggregate listings, Booked AI is designed to offer a fully interactive travel agent experience, booking and managing everything for you. It's also the first AI-powered travel product to receive IATA accreditation, meaning our Travel Agent can sell and manage travel bookings directly.",
                            ]),
                            buildExpansionTile(sizeWidth, 'Is Booked AI free to use ?', [
                              'Yes, Booked AI is free to use. We earn commissions from our service providers you book through our platform, so you can enjoy the benefits of a hassle-free transaction without any additional costs.',
                            ]),
                            buildExpansionTile(sizeWidth, 'What destiantions does Booked Ai support ? ', [
                              'Booked covers a wide range of destinations globally, booking flights, hotels, and other travel services across popular cities, remote areas, and everything else in between. Our services are ever expanding so stay tuned and join our newsletter for weekly product updates!',
                            ]),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: sizeWidth * 0.6,
                              margin: const EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          'Read more',
                                          style: textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.textSecondary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: sizeWidth * 0.85,
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            width: sizeWidth <= 850 ? sizeWidth : sizeWidth * 0.4,
                            child: Text(
                              'Pioneering the Future of Travel with AI Innovation',
                              textScaler: const TextScaler.linear(1.1),
                              textAlign: TextAlign.center,
                              style: textTheme.bodyLarge?.copyWith(
                                  height: 1, fontSize: sizeWidth <= 850 ? 30 : 40, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const ButtonGoogleAndApple(),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                      onPressed: () => exploreViewModel.toggleMenu(),
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
                                      onPressed: () {
                                        ref.read(exploreViewModelProvider.notifier).toggleGetBeta();
                                      },
                                      child: Text(
                                        'Get the BETA',
                                        style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                                      )),
                            ],
                          ),
                        ),
                      ),
                      MenuBarWidget(isMenuOpen: isMenuOpen, textTheme: textTheme, sizeWidth: sizeWidth),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 115,
              right: sizeWidth <= 1210 ? 116 : 154,
              child: isGetTheBeta
                  ? AnimatedContainer(
                      color: Colors.white,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.linear,
                      height: 100,
                      width: 140,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  final Uri url = Uri.parse('https://apps.apple.com/au/app/booked-ai/id6473001180');
                                  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Text(
                                  'IOS',
                                  style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                )),
                            TextButton(
                                onPressed: () async {
                                  final Uri url = Uri.parse('https://apps.apple.com/au/app/booked-ai/id6473001180');
                                  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child:
                                    Text('Android', style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildExpansionTile(double sizeWidth, String title, List<String> subItems) {
    return Container(
      width: sizeWidth * 0.6,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 0.5),
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      child: ExpansionTile(
        iconColor: Colors.blue,
        tilePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: subItems
            .map((subItem) => ListTile(
                  title: Text(subItem),
                ))
            .toList(),
      ),
    );
  }
}

class AnimateImages extends StatelessWidget {
  const AnimateImages({
    super.key,
    required this.images,
    required this.sizeWidth,
    required this.screenWidth,
    required this.img,
  });

  final List<String> images;
  final double sizeWidth;
  final double screenWidth;
  final List<String> img;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              border: Border.all(
                color: Colors.grey.shade600,
                width: 0.1,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  child: SvgPicture.network(
                    fit: BoxFit.cover,
                    'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e32f187d954a8525c2375_Recommendations%20screen.svg',
                  ),
                ),
                Center(
                  child: Container(
                    height: 150,
                    child: ScrollLoopAutoScroll(
                        child: Row(
                          children: [
                            MarqueImagesWidget(imageUrl: images[0]),
                            MarqueImagesWidget(imageUrl: images[1]),
                            MarqueImagesWidget(imageUrl: images[2]),
                            MarqueImagesWidget(imageUrl: images[0]),
                            MarqueImagesWidget(imageUrl: images[1]),
                            MarqueImagesWidget(imageUrl: images[2]),
                            MarqueImagesWidget(imageUrl: images[0]),
                            MarqueImagesWidget(imageUrl: images[1]),
                            MarqueImagesWidget(imageUrl: images[2]),
                          ],
                        ),
                        scrollDirection: Axis.horizontal,
                        delay: const Duration(seconds: 1),
                        duration: const Duration(seconds: 40),
                        reverseScroll: true,
                        duplicateChild: 1,
                        enableScrollInput: true,
                        delayAfterScrollInput: const Duration(seconds: 3)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'Flights from 300+ Airlines - Instantly',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: sizeWidth <= 850 ? screenWidth : sizeWidth * 0.3,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Our AI Travel Agent finds flights in seconds, from the cheapest to the quickest, offering cost-effective and convenient choices tailored to your needs.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              border: Border.all(
                color: Colors.grey.shade600,
                width: 0.1,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  child: SvgPicture.network(
                    fit: BoxFit.cover,
                    'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e32f187d954a8525c2375_Recommendations%20screen.svg',
                  ),
                ),
                Center(
                  child: Container(
                    height: 150,
                    child: ScrollLoopAutoScroll(
                        child: Row(
                          children: [
                            MarqueImagesSVGWidget(imageUrl: img[0]),
                            MarqueImagesSVGWidget(imageUrl: img[1]),
                            MarqueImagesSVGWidget(imageUrl: img[2]),
                            MarqueImagesSVGWidget(imageUrl: img[0]),
                            MarqueImagesSVGWidget(imageUrl: img[1]),
                            MarqueImagesSVGWidget(imageUrl: img[2]),
                            MarqueImagesSVGWidget(imageUrl: img[0]),
                            MarqueImagesSVGWidget(imageUrl: img[1]),
                            MarqueImagesSVGWidget(imageUrl: img[2]),
                          ],
                        ),
                        scrollDirection: Axis.horizontal,
                        delay: const Duration(seconds: 1),
                        duration: const Duration(seconds: 40),
                        reverseScroll: true,
                        duplicateChild: 1,
                        enableScrollInput: true,
                        delayAfterScrollInput: const Duration(seconds: 3)),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: const Text(
                          'Experience a collection of over 1,000 hotels',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: sizeWidth <= 850 ? screenWidth : sizeWidth * 0.3,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: const Text(
                          textAlign: TextAlign.center,
                          "We've collaborated with over 1,000 hotels worldwide, providing accommodation options catering to all budgets, from \$ to \$\$\$.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimateImagesSVG extends StatelessWidget {
  const AnimateImagesSVG({
    super.key,
    required this.images,
    required this.sizeWidth,
    required this.screenWidth,
    required this.img,
  });

  final List<String> images;
  final double sizeWidth;
  final double screenWidth;
  final List<String> img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              border: Border.all(
                color: Colors.grey.shade600,
                width: 0.1,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  child: SvgPicture.network(
                    fit: BoxFit.cover,
                    'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e32f187d954a8525c2375_Recommendations%20screen.svg',
                  ),
                ),
                Center(
                  child: Container(
                    height: 150,
                    child: ScrollLoopAutoScroll(
                        child: Row(
                          children: [
                            MarqueImagesWidget(imageUrl: images[0]),
                            MarqueImagesWidget(imageUrl: images[1]),
                            MarqueImagesWidget(imageUrl: images[2]),
                            MarqueImagesWidget(imageUrl: images[0]),
                            MarqueImagesWidget(imageUrl: images[1]),
                            MarqueImagesWidget(imageUrl: images[2]),
                            MarqueImagesWidget(imageUrl: images[0]),
                            MarqueImagesWidget(imageUrl: images[1]),
                            MarqueImagesWidget(imageUrl: images[2]),
                          ],
                        ),
                        scrollDirection: Axis.horizontal,
                        delay: const Duration(seconds: 1),
                        duration: const Duration(seconds: 40),
                        reverseScroll: true,
                        duplicateChild: 1,
                        enableScrollInput: true,
                        delayAfterScrollInput: const Duration(seconds: 3)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: const Text(
                        'Flights from 300+ Airlines - Instantly',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: sizeWidth <= 850 ? screenWidth : sizeWidth * 0.3,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Our AI Travel Agent finds flights in seconds, from the cheapest to the quickest, offering cost-effective and convenient choices tailored to your needs.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              border: Border.all(
                color: Colors.grey.shade600,
                width: 0.1,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  child: SvgPicture.network(
                    fit: BoxFit.cover,
                    'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661e32f187d954a8525c2375_Recommendations%20screen.svg',
                  ),
                ),
                Center(
                  child: Container(
                    height: 150,
                    child: ScrollLoopAutoScroll(
                        child: Row(
                          children: [
                            MarqueImagesSVGWidget(imageUrl: img[0]),
                            MarqueImagesSVGWidget(imageUrl: img[1]),
                            MarqueImagesSVGWidget(imageUrl: img[2]),
                            MarqueImagesSVGWidget(imageUrl: img[0]),
                            MarqueImagesSVGWidget(imageUrl: img[1]),
                            MarqueImagesSVGWidget(imageUrl: img[2]),
                            MarqueImagesSVGWidget(imageUrl: img[0]),
                            MarqueImagesSVGWidget(imageUrl: img[1]),
                            MarqueImagesSVGWidget(imageUrl: img[2]),
                          ],
                        ),
                        scrollDirection: Axis.horizontal,
                        delay: const Duration(seconds: 1),
                        duration: const Duration(seconds: 40),
                        reverseScroll: true,
                        duplicateChild: 1,
                        enableScrollInput: true,
                        delayAfterScrollInput: const Duration(seconds: 3)),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: const Text(
                          'Experience a collection of over 1,000 hotels',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: sizeWidth <= 850 ? screenWidth : sizeWidth * 0.3,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: const Text(
                          textAlign: TextAlign.center,
                          "We've collaborated with over 1,000 hotels worldwide, providing accommodation options catering to all budgets, from \$ to \$\$\$.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MarqueImagesWidget extends StatelessWidget {
  const MarqueImagesWidget({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Image.network(
        fit: BoxFit.contain,
        imageUrl,
      ),
    );
  }
}

class MarqueImagesSVGWidget extends StatelessWidget {
  const MarqueImagesSVGWidget({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SvgPicture.network(
        fit: BoxFit.contain,
        imageUrl,
      ),
    );
  }
}

class ListViewDealsWidgetMobile extends ConsumerWidget {
  const ListViewDealsWidgetMobile({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
    required this.deals,
  });

  final double sizeWidth;
  final TextTheme textTheme;
  final List<DealsModel> deals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: deals.length, // Number of items in the list
        itemBuilder: (context, index) {
          final deal = deals[index];
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
                      height: 320,
                      child: Image.network(
                        deal.image,
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
                        Container(
                          child: Text(
                            deal.title,
                            style: textTheme.bodyLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: sizeWidth <= 850 ? sizeWidth : sizeWidth * 0.6,
                          child: Text(maxLines: 4, deal.description),
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
                for (var dealDetail in deal.dealsDetails)
                  DealsListWidgetMobile(sizeWidth: sizeWidth, textTheme: textTheme, dealsDetail: dealDetail),

                // DealsListWidgetMobile(sizeWidth: sizeWidth, textTheme: textTheme),
                // const SizedBox(
                //   height: 20,
                // ),
                // DealsListWidgetMobile(sizeWidth: sizeWidth, textTheme: textTheme),
              ],
            ),
          );
        });
  }
}

class DealsListViewWidget extends ConsumerWidget {
  const DealsListViewWidget({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
    required this.deals,
  });

  final double sizeWidth;
  final TextTheme textTheme;
  final List<DealsModel> deals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: sizeWidth < 1160 ? sizeWidth * 0.89 : sizeWidth * 0.83,
      child: Transform.translate(
          offset: const Offset(0, -116),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: deals.length, // Number of items in the list
            itemBuilder: (context, index) {
              final deal = deals[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
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
                              height: 320,
                              width: sizeWidth < 1160 ? sizeWidth * 0.28 : sizeWidth * 0.26,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: deal.image,
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),

                              // Image.network(
                              //   deal.image,
                              //   width: double.infinity,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ],
                        ),
                        for (var dealDetail in deal.dealsDetails)
                          DealsListWidget(sizeWidth: sizeWidth, textTheme: textTheme, dealsDetail: dealDetail),
                      ],
                    ),
                    Container(
                      width: sizeWidth * 0.25,
                      child: Text(
                        deal.title,
                        style: textTheme.bodyLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: sizeWidth * 0.25,
                          child: Text(deal.description),
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
    required this.dealsDetail,
  });

  final double sizeWidth;
  final TextTheme textTheme;
  final DealsDetails dealsDetail;

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
                          'Available until ${DateFormat('dd MMM').format(dealsDetail.dateAvailable)}',
                          style: textTheme.bodyLarge
                              ?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
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
                        dealsDetail.name,
                        style: textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          dealsDetail.type,
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
                        FittedBox(child: Text(dealsDetail.name)),
                        const SizedBox(
                          width: 8,
                        ),
                        FittedBox(
                            child: Text(
                          '${dealsDetail.from} to ${dealsDetail.to}',
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
                    child: FittedBox(
                        child: Text(
                      '\$${dealsDetail.price}',
                    )),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text('\$600', style: textTheme.bodyLarge?.copyWith(color: Colors.grey.shade400)),
                      Container(
                        height: 1,
                        width: 40,
                        color: Colors.grey,
                      ),
                    ],
                  )
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
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$${dealsDetail.price}',
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
    required this.dealsDetail,
  });

  final double sizeWidth;
  final TextTheme textTheme;
  final DealsDetails dealsDetail;

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
                          'Available until ${DateFormat('dd MMM').format(dealsDetail.dateAvailable)}',
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
                        dealsDetail.name,
                        style: textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          dealsDetail.type,
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
                        FittedBox(child: Text(dealsDetail.name)),
                        const SizedBox(
                          width: 8,
                        ),
                        FittedBox(
                            child: Text(
                          '${dealsDetail.from} to ${dealsDetail.to}',
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
                    child: FittedBox(child: Text('\$${dealsDetail.price}')),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text('\$600', style: textTheme.bodyLarge?.copyWith(color: Colors.grey.shade400)),
                      Container(
                        height: 1,
                        width: 40,
                        color: Colors.grey,
                      ),
                    ],
                  )
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
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$${dealsDetail.price}',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
