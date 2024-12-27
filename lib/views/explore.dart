import 'package:booked_ai/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../view_models/explore_view_model.dart';

class ExploreView extends ConsumerWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print('Screen Width $sizeWidth');

    final textTheme = Theme.of(context).textTheme;
    final scrollControllerNotifiers = ref.watch(scrollControllerProvider);
    final scrollController = scrollControllerNotifiers.controller;
    final scrollControllerNotifier = ref.watch(scrollControllerProvider.notifier);

    var isMenuOpen = ref.watch(menuToggleProvider);
    final menuToggle = ref.read(menuToggleProvider.notifier);

    Color containerColor = (scrollControllerNotifier.hasReachedTop) ? Colors.transparent : Colors.white;

    if (sizeWidth > 1126 && isMenuOpen) {
      isMenuOpen = false;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                      height: 445,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Explore',
                            textScaler: const TextScaler.linear(1.1),
                            style: textTheme.bodyLarge?.copyWith(fontSize: 35, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Learn about newest travel trends and amazing places to visit!',
                              textScaler: const TextScaler.linear(1.1),
                              textAlign: TextAlign.center,
                              style: textTheme.bodyLarge
                                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey.shade700),
                            ),
                          ),
                        ],
                      )),
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
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: sizeWidth < 768
                              ? 1
                              : sizeWidth > 768 && sizeWidth <= 1000
                                  ? 2
                                  : 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 40,
                          childAspectRatio: sizeWidth < 768
                              ? 0.73
                              : sizeWidth > 768 && sizeWidth <= 1000
                                  ? 0.63
                                  : 0.6,

                          // childAspectRatio: sizeWidth <= 500
                          //     ? 0.83
                          //     : sizeWidth <= 850
                          //         ? 1.2
                          //         : sizeWidth > 850 && sizeWidth <= 1100
                          //             ? 0.4
                          //             : 0.76,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Card(
                            key: ValueKey(index),
                            color: Colors.white,
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Image.network(
                                    'https://cdn.prod.website-files.com/6613f5a399757c17cec4c187/673fdaa6f71d19faf24c632f_miami_city_bookedai.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  // Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     SizedBox(
                                  //       height: 20,
                                  //     ),
                                  //     const Text(
                                  //       'Title of the Content',
                                  //       style: TextStyle(
                                  //         fontSize: 18,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //     const SizedBox(height: 8),
                                  //     Container(
                                  //       height: 100,
                                  //       child: Text(
                                  //         'South Beach is Miami’s hotspot for art deco architecture, lively nightlife, and pristine beaches. Spend your days relaxing on the sand and your nights exploring the famous Ocean Drive. Book your Miami trip with travel AI tools for the best deals on flights and stays.',
                                  //         maxLines: 4,
                                  //         overflow: TextOverflow.ellipsis,
                                  //         style: TextStyle(
                                  //           fontSize: 14,
                                  //           color: Colors.grey[700],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     const SizedBox(height: 10),
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: Row(
                                  //         children: [
                                  //           Text(
                                  //             'Read more',
                                  //             style: textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
                                  //           ),
                                  //           const SizedBox(
                                  //             width: 4,
                                  //           ),
                                  //           const Icon(
                                  //             Icons.arrow_forward,
                                  //             color: AppColors.textSecondary,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     const SizedBox(height: 30),
                                  //     const Row(
                                  //       children: [
                                  //         Icon(Icons.location_on, color: Colors.grey, size: 26),
                                  //         SizedBox(width: 6),
                                  //         Text(
                                  //           'London UK',
                                  //           style: TextStyle(
                                  //             fontSize: 14,
                                  //             fontWeight: FontWeight.w600,
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     const SizedBox(height: 8),
                                  //     const Row(
                                  //       children: [
                                  //         Icon(Icons.card_giftcard, color: Colors.grey, size: 26),
                                  //         SizedBox(width: 6),
                                  //         Text(
                                  //           'Art and Culture Deep Dive',
                                  //           style: TextStyle(
                                  //             fontSize: 14,
                                  //             fontWeight: FontWeight.w600,
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     const ListTile(
                                  //       contentPadding: EdgeInsets.only(left: 2),
                                  //       leading: CircleAvatar(
                                  //         radius: 15,
                                  //         backgroundImage: NetworkImage(
                                  //           'https://png.pngtree.com/png-vector/20230831/ourmid/pngtree-man-avatar-image-for-profile-png-image_9197908.png',
                                  //         ),
                                  //       ),
                                  //       title: Text(
                                  //         'Mennan Yelkenci',
                                  //         style: TextStyle(
                                  //           fontSize: 14,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Colors.black,
                                  //         ),
                                  //       ),
                                  //       subtitle: Text('3 min read'),
                                  //     )
                                  //   ],
                                  // ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'Trip to London',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 90,
                                          child: Text(
                                            'South Beach is Miami’s hotspot for art deco architecture, lively nightlife, and pristine beaches. Spend your days relaxing on the sand and your nights exploring the famous Ocean Drive. Book your Miami trip with travel AI tools for the best deals on flights and stays.',
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),
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
                                        const Row(
                                          children: [
                                            Icon(Icons.location_on, color: Colors.grey, size: 26),
                                            SizedBox(width: 6),
                                            Text(
                                              'London UK',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.card_giftcard, color: Colors.grey, size: 26),
                                            SizedBox(width: 6),
                                            Text(
                                              'Art and Culture Deep Dive',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: CircleAvatar(
                                            radius: 15,
                                            backgroundImage: NetworkImage(
                                              'https://png.pngtree.com/png-vector/20230831/ourmid/pngtree-man-avatar-image-for-profile-png-image_9197908.png',
                                            ),
                                          ),
                                          title: Text(
                                            'Mennan Yelkenci',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          subtitle: Text('3 min read'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 15),
                    color: AppColors.bgFooter,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 70),
                          child: Wrap(
                            runAlignment: WrapAlignment.spaceBetween,
                            alignment: WrapAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 20),
                                width: 300,
                                child: SvgPicture.network(
                                  fit: BoxFit.cover,
                                  'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66139b9ea95f59c73e59cd0f_footer-logo.svg',
                                ),
                                // child: Image.network(
                                //     'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66139b9ea95f59c73e59cd0f_footer-logo.svg'),
                              ),
                              Container(
                                width: 700,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Wrap(
                                  spacing: 30,
                                  children: List.generate(ref.watch(exploreNavBarTitleProvider).length, (index) {
                                    final navBarTitles = ref.watch(exploreNavBarTitleProvider);
                                    var hoveringValue = ref.watch(isHoveringTheNavBar);
                                    var _currentIndexNavBar = ref.watch(currentIndexNavBar);
                                    return InkWell(
                                      onHover: (isHovering) {
                                        if (isHovering) {
                                          ref.read(isHoveringTheNavBar.notifier).state =
                                              navBarTitles[index]['isHovering'] = 'Yes';

                                          print('navBarTitles $navBarTitles');
                                        } else {
                                          ref.read(isHoveringTheNavBar.notifier).state =
                                              navBarTitles[index]['isHovering'] = 'No';
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
                                              ref.read(isHoveringTheNavBar.notifier).state =
                                                  navBarTitles[0]['isHovering'] = 'No';
                                            },
                                            child: Text(navBarTitles[index]['title'] ?? '',
                                                style: textTheme.bodyLarge?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: _currentIndexNavBar == index ||
                                                          navBarTitles[index]['isHovering'] == 'Yes'
                                                      ? AppColors.textSecondary
                                                      : Colors.grey.shade600,
                                                ))),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Container(
                                width: 400,
                                alignment: Alignment.center,
                                child: Wrap(
                                    spacing: 30,
                                    children: List.generate(4, (index) {
                                      final _currentIndexSocialMedia = ref.watch(currentIndexSocialMedia);
                                      return InkWell(
                                        onHover: (isHovering) {
                                          if (isHovering) {
                                            ref.read(currentIndexSocialMedia.notifier).state = index;
                                          } else {
                                            ref.read(currentIndexSocialMedia.notifier).state = null;
                                          }
                                        },
                                        onTap: () {},
                                        child: Icon(
                                          Icons.facebook,
                                          color: _currentIndexSocialMedia == index ? Colors.white : Colors.grey,
                                        ),
                                      );
                                    })
                                    // [
                                    //   Icon(
                                    //     Icons.facebook,
                                    //     color: Colors.grey,
                                    //   ),
                                    //   Icon(
                                    //     Icons.facebook,
                                    //     color: Colors.grey,
                                    //   ),
                                    //   Icon(
                                    //     Icons.facebook,
                                    //     color: Colors.grey,
                                    //   ),
                                    //   Icon(
                                    //     Icons.facebook,
                                    //     color: Colors.grey,
                                    //   ),
                                    // ],
                                    ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: MediaQuery.of(context).size.width < 850 ? 32 : 160),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 400,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  '@Copyright ${DateTime.now().year.toString()}, All Rights Reserve',
                                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: 400,
                                margin: const EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                child: Wrap(
                                  spacing: 20,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: SvgPicture.network(
                                        fit: BoxFit.cover,
                                        'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6613ccc0821e816951d67ff4_googleplay.svg',
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: SvgPicture.network(
                                        fit: BoxFit.cover,
                                        'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6613ccd51e501225d2fb36c6_appstore.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 400,
                                height: 40,
                                alignment: Alignment.center,
                                child: Wrap(
                                  spacing: 20,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Provicy and Policy',
                                        style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Terms & Condition',
                                        style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // First fixed container
          Positioned(
              top: 155,
              right: 0,
              left: 0,
              child: AnimatedContainer(
                color: Colors.white,
                margin: EdgeInsets.only(right: 15),
                duration: Duration(milliseconds: 500), // Smooth animation duration
                curve: Curves.easeInOut, // Smooth easing curve
                height: isMenuOpen ? 280 : 0, // Adjust height for open/close
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
                          final _currentIndexNavBar = ref.watch(currentIndexNavBar);

                          return InkWell(
                            onHover: (isHovering) {
                              if (isHovering) {
                                ref.read(isHoveringTheNavBar.notifier).state =
                                    navBarTitles[index]['isHovering'] = 'Yes';

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
                                        color:
                                            _currentIndexNavBar == index || navBarTitles[index]['isHovering'] == 'Yes'
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
                      ElevatedButton(
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
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )),

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
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text('Holiday Deals',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                          )),
                      Text('Earn  \$40 cash back on any flight or hote booking ',
                          textScaler: const TextScaler.linear(1.2),
                          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
                      const SizedBox()
                      // Flexible(flex: 9, child: SizedBox()),
                    ],
                  ),
                ),
                Container(
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
                            : Wrap(
                                spacing: 30,
                                children: List.generate(ref.watch(exploreNavBarTitleProvider).length, (index) {
                                  final navBarTitles = ref.watch(exploreNavBarTitleProvider);
                                  var hoveringValue = ref.watch(isHoveringTheNavBar);
                                  var _currentIndexNavBar = ref.watch(currentIndexNavBar);
                                  return InkWell(
                                    onHover: (isHovering) {
                                      if (isHovering) {
                                        ref.read(isHoveringTheNavBar.notifier).state =
                                            navBarTitles[index]['isHovering'] = 'Yes';

                                        print('navBarTitles $navBarTitles');
                                      } else {
                                        ref.read(isHoveringTheNavBar.notifier).state =
                                            navBarTitles[index]['isHovering'] = 'No';
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
                                            ref.read(isHoveringTheNavBar.notifier).state =
                                                navBarTitles[0]['isHovering'] = 'No';
                                          },
                                          child: Text(navBarTitles[index]['title'] ?? '',
                                              style: textTheme.bodyLarge?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: _currentIndexNavBar == index ||
                                                        navBarTitles[index]['isHovering'] == 'Yes'
                                                    ? AppColors.textSecondary
                                                    : Colors.grey.shade600,
                                              ))),
                                    ),
                                  );
                                }),
                              ),
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
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;

  const MenuItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
