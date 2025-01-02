import 'dart:math';

import 'package:booked_ai/models/explore_model.dart';
import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/blog_view_model.dart';
import 'package:booked_ai/view_models/partner_with_us_view_model.dart';
import 'package:booked_ai/views/blog/blog_grid_view_widget.dart';
import 'package:booked_ai/views/explore/footer_widget.dart';
import 'package:booked_ai/views/explore/grid_view_widget.dart';
import 'package:booked_ai/views/explore/header_widget.dart';
import 'package:booked_ai/views/explore/holiday_deals_widget.dart';
import 'package:booked_ai/views/explore/menu_bar_widget.dart';
import 'package:booked_ai/views/explore/navbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../view_models/explore_view_model.dart';

class PartnerWithUsView extends ConsumerWidget {
  const PartnerWithUsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print('Screen Width $sizeWidth');

    final textTheme = Theme.of(context).textTheme;

    final images = [
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e749b0f798c1705843c_587b518244060909aa603a8b%201.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e74ada842f7f029a81c_587b518e44060909aa603a8c%201-p-500.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661d0c60c8043e14497aba8e_qantas.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7490f97e6d3bd1be01_585e9e12cb11b227491c34fd%201.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e75d0800799b45cc817_5847f199cef1014c0b5e485b%201.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7404100e61ae8a6b69_All_Nippon_Airways_logo_PNG3%201.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e746fb97c3af6c66b45_585e9ddbcb11b227491c34fc%201.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7490f97e6d3bd1be01_585e9e12cb11b227491c34fd%201.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e749b0f798c1705843c_587b518244060909aa603a8b%201.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e74ada842f7f029a81c_587b518e44060909aa603a8c%201-p-500.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661d0c60c8043e14497aba8e_qantas.png',
      'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7490f97e6d3bd1be01_585e9e12cb11b227491c34fd%201.png',
    ];
    final partnerWithUsViewModel = ref.watch(partnerWithUsViewModelProvider);
    final scrollController = partnerWithUsViewModel.controller;
    final isScrollingReachTheTop = partnerWithUsViewModel.hasReachedTop;

    final exploreViewModel = ref.watch(exploreViewModelProvider);

    var isGetTheBeta = exploreViewModel.isToggleGetBeta;

    exploreViewModel.setCurrentIndexNavBar(3);

    var isMenuOpen = exploreViewModel.isToggleMenu;

    final menuToggle = ref.read(exploreViewModelProvider.notifier);

    Color containerColor = isScrollingReachTheTop ? Colors.transparent : Colors.white;

    if (sizeWidth <= 1126 && isGetTheBeta) {
      isGetTheBeta = false;
    }

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
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(right: 15),
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk2MC1uaW5nLTMwLmpwZw.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 250,
                                ),
                                alignment: Alignment.topCenter,
                                height: sizeHeight * 0.8,
                                child: Padding(
                                  padding: EdgeInsets.only(left: sizeWidth <= 850 ? 20 : 140),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Integrate an AI Travel Agent in No Time',
                                            style: textTheme.bodyLarge?.copyWith(
                                              fontSize: sizeWidth <= 590
                                                  ? 30
                                                  : sizeWidth <= 1150
                                                      ? 40
                                                      : 60,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                            ),
                                            // textHeightBehavior: TextHeightBehavior(
                                            //   applyHeightToFirstAscent: false,
                                            //   applyHeightToLastDescent: true,
                                            // ),
                                          ),
                                        ),
                                        Container(
                                          width: sizeWidth * 0.4,
                                          child: Text(
                                            'Partner with us to add a cutting-edge AI travel agent to your website – fully operational in under 24 hours.',
                                            style: textTheme.bodyLarge?.copyWith(
                                                fontSize: sizeWidth <= 1150 ? 16 : 22,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                        ),
                                        Container(
                                          width: sizeWidth * 0.4,
                                          child: Text(
                                            'Apply to become a partner of Booked AI Today!',
                                            style: textTheme.bodyLarge
                                                ?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            // Define your action here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: Size(150, 40),
                                            backgroundColor: AppColors.textSecondary, // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8), // Rounded corners
                                            ),
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                          ),
                                          icon: const Text(
                                            'Apply Now',
                                            style: TextStyle(color: Colors.white), // Text style
                                          ),
                                          label: const Icon(Icons.arrow_forward, color: Colors.white), // Icon
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  margin: EdgeInsets.only(
                                    top: 250,
                                  ),
                                  height: sizeHeight * 0.8,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675682e1ba44cad5541bebdd_cover%20image%20whole%204x.png', // Replace with your image URL
                                      ),
                                      fit: BoxFit.contain, // Ensures the image covers the container
                                    ),
                                  )),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: sizeWidth < 768
                              ? 12
                              : sizeWidth > 768 && sizeWidth < 1328
                                  ? 40
                                  : 140),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: sizeWidth <= 850 ? sizeWidth - 30 : sizeWidth * 0.4,
                      margin: EdgeInsets.only(right: 15),
                      child: Column(
                        children: [
                          Text(
                            'What is Booked AI?',
                            style: textTheme.bodyLarge?.copyWith(
                              fontSize: sizeWidth <= 1150 ? 30 : 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'An Around-the-clock Personal AI Travel Agent',
                            style: textTheme.bodyLarge?.copyWith(
                                fontSize: sizeWidth <= 1150 ? 16 : 22, fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
                          AspectRatio(
                            aspectRatio: 8 / 4,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6758d76a8e28d31114b9d15a_Frame%201618872751-p-1600.png',
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          Text(
                            'Booked AI manages your flights, hotels, and itineraries through an easy-to-use chat platform.',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge?.copyWith(
                                fontSize: sizeWidth <= 1150 ? 16 : 22, fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: sizeWidth <= 850 ? sizeWidth - 30 : sizeWidth * 0.8,
                      margin: EdgeInsets.only(bottom: 20),
                      child: LayoutBuilder(builder: (context, constraints) {
                        int numberColumn = 3;

                        if (sizeWidth < 850) {
                          numberColumn = 1;
                        } else if (sizeWidth <= 1250) {
                          numberColumn = 2;
                        } else {
                          numberColumn = 3;
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: numberColumn,
                              mainAxisSpacing: 20.0, // Vertical spacing between rows
                              crossAxisSpacing: 20.0, // Horizontal spacing between columns
                              childAspectRatio: numberColumn == 1
                                  ? sizeWidth <= 556
                                      ? 0.85
                                      : sizeWidth <= 606
                                          ? 1
                                          : sizeWidth <= 704
                                              ? 1.1
                                              : sizeWidth <= 780
                                                  ? 1.3
                                                  : 1.4
                                  : numberColumn == 2
                                      ? sizeWidth <= 890
                                          ? 0.58
                                          : sizeWidth <= 1089
                                              ? 0.62
                                              : 0.82
                                      : sizeWidth <= 1345
                                          ? 0.54
                                          : sizeWidth <= 1462
                                              ? 0.62
                                              : sizeWidth <= 1510
                                                  ? 0.68
                                                  : sizeWidth <= 1340
                                                      ? 0.56
                                                      : 0.75),
                          itemCount: 3, // Total number of items
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: AppColors.primary50,
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                  width: 0.1,
                                ),
                              ),
                              child: index == 0
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 8),
                                              margin: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary100,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  TabItem(label: 'Cheapest', isSelected: true),
                                                  TabItem(label: 'Shortest', isSelected: false),
                                                  TabItem(label: 'Longest', isSelected: false),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    blurRadius: 10,
                                                    spreadRadius: 2,
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      color: Colors.green[100],
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Text('Cheapest',
                                                        style: textTheme.bodyLarge
                                                            ?.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            alignment: Alignment.centerLeft,
                                                            child: CachedNetworkImage(
                                                              width: 40,
                                                              height: 40,
                                                              fit: BoxFit.contain,
                                                              imageUrl:
                                                                  'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6755305d96b1db7483121452_Image.png',
                                                              placeholder: (context, url) =>
                                                                  const Center(child: CircularProgressIndicator()),
                                                              errorWidget: (context, url, error) =>
                                                                  const Icon(Icons.error),
                                                            ),
                                                          )),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            '5h 36m',
                                                            style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                              alignment: Alignment.centerRight,
                                                              child: Text(
                                                                'JetStar Airways',
                                                                textAlign: TextAlign.end,
                                                                style: textTheme.bodyLarge
                                                                    ?.copyWith(fontSize: 12, color: Colors.grey),
                                                              ))),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                  child: Text(
                                                                'Departure',
                                                                style: textTheme.bodyLarge
                                                                    ?.copyWith(fontSize: 12, color: Colors.grey),
                                                              ))),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                '1 stop',
                                                                style: textTheme.bodyLarge
                                                                    ?.copyWith(fontSize: 12, color: Colors.grey),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                  alignment: Alignment.centerRight,
                                                                  child: Text(
                                                                    'Arrival',
                                                                    style: textTheme.bodyLarge
                                                                        ?.copyWith(fontSize: 12, color: Colors.grey),
                                                                  ))),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                  child: Text(
                                                                '09:00',
                                                                style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                                                              ))),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                'Brisbane',
                                                                style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                  alignment: Alignment.centerRight,
                                                                  child: Text(
                                                                    '14:36',
                                                                    style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                                                                  ))),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: Text(
                                                                    'Sydney(SYD)',
                                                                    style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                                                                  ))),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                '3h 00m Transfer',
                                                                style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                  alignment: Alignment.centerRight,
                                                                  child: Text(
                                                                    'Hamilton Island(HTI)',
                                                                    textAlign: TextAlign.end,
                                                                    style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                                                                  ))),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              flex: 3,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                      child: Text(
                                                                    '\$99 AUD',
                                                                    style: textTheme.bodyLarge?.copyWith(
                                                                        fontSize: 12, fontWeight: FontWeight.bold),
                                                                  )),
                                                                  Container(
                                                                      child: Text(
                                                                    '\$33 cheaper than average',
                                                                    style: textTheme.bodyLarge?.copyWith(
                                                                        fontSize: 10, fontWeight: FontWeight.w600),
                                                                  )),
                                                                ],
                                                              )),
                                                          Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                alignment: Alignment.centerRight,
                                                                child: ElevatedButton(
                                                                  onPressed: () {},
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor: AppColors.textSecondary,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(2),
                                                                    ),
                                                                  ),
                                                                  child: FittedBox(
                                                                    child: Text(
                                                                      'Select flight',
                                                                      style: textTheme.bodyLarge
                                                                          ?.copyWith(fontSize: 12, color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                                  child: const Text(
                                                    'Efficient AI Integrated Solution\nAvailable 24/7',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                                  child: const Text(
                                                    'Streamline travel planning with 24/7 AI powered assistance. Identify the most efficient options for your team, all in real-time.',
                                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : index == 1
                                      ? Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(vertical: 60),
                                              height: 215,
                                              child: SvgPicture.network(
                                                fit: BoxFit.contain,
                                                'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6656a5284a9bc07d570c5994_earth-map-image.svg',
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                                  child: const Text(
                                                    'Efficient AI Integrated Solution\nAvailable 24/7',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                                  child: const Text(
                                                    'Streamline travel planning with 24/7 AI powered assistance. Identify the most efficient options for your team, all in real-time.',
                                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 215,
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 30,
                                              ),

                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20), // Rounded top-left corner
                                                  topRight: Radius.circular(20), // Rounded top-right corner
                                                ),
                                              ),
                                              clipBehavior:
                                                  Clip.hardEdge, // Ensures the child respects the border radius
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://blog.italotreno.com/wp-content/uploads/2024/02/Cinque_Terre_sito_unesco.jpg',
                                                placeholder: (context, url) => Center(
                                                  child: CircularProgressIndicator(), // Loader for placeholder
                                                ),
                                                errorWidget: (context, url, error) => Center(
                                                  child: Icon(Icons.error, color: Colors.red), // Error widget
                                                ),
                                                fit: BoxFit.cover, // Adjust image fit inside the container
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal: 28),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(Icons.calendar_month),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text('21 days')
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [Icon(Icons.location_on), Text('5 Locations')],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(Icons.people),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text('2 Adults')
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [Icon(Icons.attach_money), Text('21,1890 AUD')],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                                  child: const Text(
                                                    'Custom Travel Itineraries, Designed for Your Clients',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                                  child: const Text(
                                                    "We build the perfect travel package, tailored to client needs. We handle the heavy lifting, and you're free to make changes anytime.",
                                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                            );
                          },
                        );
                      }),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: sizeWidth * 0.8,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'An all-in-one solution to streamline your service',
                                    style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text('Automate every step of the travel booking process',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(Icons.check, color: AppColors.textSecondary),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text('Reduce manual effort while achieving cost and time savings',
                                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.primary100,
                                        child: Icon(
                                          Icons.check,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: sizeWidth * 0.3,
                                          child: Text(
                                            'Track bookings, spending, and efficiency',
                                            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675670a01b306361a5a9d9f5_All%20in%20one%20solution%20illos.png',
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: sizeWidth * 0.7,
                      child: Column(
                        children: [
                          Text(
                            'Revolution is ongoing!',
                            style: textTheme.bodyLarge
                                ?.copyWith(fontSize: sizeWidth <= 1150 ? 30 : 50, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Set up and operational within 24 hours',
                            textScaleFactor: 1.2,
                            style: textTheme.bodyLarge?.copyWith(
                                fontSize: sizeWidth <= 1150 ? 16 : 22, color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              RevolutionWidget(
                                textTheme: textTheme,
                                borderLeftColor: AppColors.textSecondary,
                                labelBButton: 'Live now',
                                title: 'Access to an extensive portfolio of over 2,000 hotels globally',
                                description:
                                    "Discover premium accommodations worldwide, from boutique stays to luxurious hotels, with options to suit every traveler's needs. Enjoy exclusive rates, seamless booking, and personalized recommendations for your perfect stay.",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RevolutionWidget(
                                textTheme: textTheme,
                                borderLeftColor: Colors.blue,
                                labelBButton: 'Coming soon',
                                title: 'Seamless car rental booking services across the globe',
                                description:
                                    'Effortlessly arrange your transportation with trusted car rental providers worldwide. Whether for road trip adventures or business reception, find the ideal vehicle for your journey with competitive pricing and flexible options.',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RevolutionWidget(
                                textTheme: textTheme,
                                borderLeftColor: AppColors.textSecondary,
                                labelBButton: 'Live now',
                                title: 'Partnerships with over 300 international and regional airlines',
                                description:
                                    "Simplify air travel with access to global and regional flight options. Book, modify, or upgrade with ease, supported by our extensive airline partnerships designed to offer convenience and competitive fares.",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RevolutionWidget(
                                textTheme: textTheme,
                                borderLeftColor: Colors.blue,
                                labelBButton: 'Coming soon',
                                title: 'Cruise booking solutions across leading providers',
                                description:
                                    'Navigate the seas with ease through our partnerships with top cruise lines. Discover tailored itineraries, luxurious amenities, and exclusive packages for an unforgettable ocean adventure.',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RevolutionWidget(
                                textTheme: textTheme,
                                borderLeftColor: AppColors.textSecondary,
                                labelBButton: 'Live now',
                                title: 'Comprehensive offerings of trips and activities worldwide',
                                description:
                                    "Explore a world of possibilities with curated experiences tailored to every interest. From guided tours to adventure activities, enhance your journey with memorable moments wherever you travel.",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RevolutionWidget(
                                textTheme: textTheme,
                                borderLeftColor: Colors.blue,
                                labelBButton: 'Coming soon',
                                title: 'Restaurant reservations tailored to your destination preferences',
                                description:
                                    'Savor your travels with handpicked dining experiences at top restaurants. From local delicacies to fine dining, we help you secure reservations that elevate your culinary journey.',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: sizeWidth * 0.8,
                      child: Column(
                        children: [
                          Text(
                            'Who is it for?',
                            style: textTheme.bodyLarge
                                ?.copyWith(fontSize: sizeWidth <= 1150 ? 30 : 50, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Any Travel Industry Players',
                            textScaleFactor: 1.2,
                            style: textTheme.bodyLarge?.copyWith(
                                fontSize: sizeWidth <= 1150 ? 16 : 22, color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: sizeWidth <= 850 ? sizeWidth - 30 : sizeWidth * 0.8,
                            margin: EdgeInsets.only(bottom: 20),
                            child: LayoutBuilder(builder: (context, constraints) {
                              int numberColumn = 3;

                              if (sizeWidth < 850) {
                                numberColumn = 1;
                              } else if (sizeWidth <= 1250) {
                                numberColumn = 2;
                              } else {
                                numberColumn = 3;
                              }

                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: numberColumn,
                                    mainAxisSpacing: 20.0, // Vertical spacing between rows
                                    crossAxisSpacing: 20.0, // Horizontal spacing between columns
                                    childAspectRatio: numberColumn == 1
                                        ? sizeWidth <= 567
                                            ? 0.7
                                            : sizeWidth <= 585
                                                ? 0.9
                                                : sizeWidth <= 606
                                                    ? 1
                                                    : sizeWidth <= 704
                                                        ? 1
                                                        : sizeWidth <= 780
                                                            ? 1.2
                                                            : 1.3
                                        : numberColumn == 2
                                            ? sizeWidth <= 890
                                                ? 0.58
                                                : sizeWidth <= 1089
                                                    ? 0.62
                                                    : 0.82
                                            : sizeWidth <= 1345
                                                ? 0.54
                                                : sizeWidth <= 1462
                                                    ? 0.62
                                                    : sizeWidth <= 1510
                                                        ? 0.68
                                                        : sizeWidth <= 1340
                                                            ? 0.56
                                                            : 0.75),
                                itemCount: ref.watch(whosIsItForProvider).length,
                                itemBuilder: (context, index) {
                                  final data = ref.watch(whosIsItForProvider)[index];

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Rounded corners
                                        child: CachedNetworkImage(
                                          height: 250,
                                          width: sizeWidth,
                                          imageUrl: data['image'] ?? '',
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) => Center(
                                            child: Icon(Icons.error, color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        data['title'] ?? '',
                                        style: textTheme.bodyLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        data['description'] ?? '',
                                        style: textTheme.bodyLarge
                                            ?.copyWith(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(data['labelButton'] ?? '',
                                              style: textTheme.bodyLarge?.copyWith(
                                                color: AppColors.textSecondary,
                                              )))
                                    ],
                                  );
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: sizeWidth * 0.8,
                      child: Column(
                        children: [
                          Text(
                            'How can we help?',
                            style: textTheme.bodyLarge
                                ?.copyWith(fontSize: sizeWidth <= 1150 ? 30 : 50, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Eliminate the Mundane, Focus on the Fun',
                            textScaleFactor: 1.2,
                            style: textTheme.bodyLarge?.copyWith(
                                fontSize: sizeWidth <= 1150 ? 16 : 22, color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'A white-labelled solution to streamline your service',
                                        style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: AppColors.primary100,
                                            child: Icon(Icons.check, color: AppColors.textSecondary),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              width: sizeWidth * 0.3,
                                              child: Text('Seamless website integration',
                                                  style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: AppColors.primary100,
                                            child: Icon(Icons.check, color: AppColors.textSecondary),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              width: sizeWidth * 0.3,
                                              child: Text('White-labelled web / mobile app',
                                                  style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: AppColors.primary100,
                                            child: Icon(
                                              Icons.check,
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              width: sizeWidth * 0.3,
                                              child: Text(
                                                'Around the clock support',
                                                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675670e7b6abaf4005891658_Frame%201618872745-p-800.png',
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),

                    Container(
                      width: sizeWidth * 0.8,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a40fdfd457aa207efce_Picture.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a40dd6a0b5be892b536_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a42459d4f94fde736b3_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a42459d4f94fde736b3_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a43f750e749d6f313e8_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a43f750e749d6f313e8_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a448fbfdf1231bfae6b_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a454bf77fc8e30ac210_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a46459d4f94fde73c8e_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CachedNetworkImage(
                                        width: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a468c7e96ec0c074011_image.png',
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Open doorways to the unexplored',
                                  style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Booked AI can bring you and your customers the unthinkable. With our data from thousands of real travellers,  we can bring the most authentic hidden gems in front of your eyes.',
                                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                FittedBox(
                                  child: TextButton.icon(
                                    onPressed: () {
                                      // Define your action here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(280, 40),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    ),
                                    icon: const Text(
                                      'Explore our top destinations',
                                      style: TextStyle(fontSize: 18, color: AppColors.textSecondary), // Text style
                                    ),
                                    label: const Icon(Icons.arrow_forward, color: AppColors.textSecondary), // Icon
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 15),
                      child: ScrollLoopAutoScroll(
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[0],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[1],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[2],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[3],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[4],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[5],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[6],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[7],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[8],
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Image.network(
                                  images[9],
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          scrollDirection: Axis.horizontal,
                          delay: Duration(seconds: 1),
                          duration: Duration(seconds: 30),
                          gap: 25,
                          reverseScroll: false,
                          duplicateChild: 1,
                          enableScrollInput: true,
                          delayAfterScrollInput: Duration(seconds: 3)),
                    ),
                    SizedBox(
                      height: 60,
                    ),

                    //Footer
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk2MC1uaW5nLTMwLmpwZw.jpg',
                          ),
                          fit: BoxFit.cover,
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
                                        progress:
                                            isMenuOpen ? AlwaysStoppedAnimation(1.0) : AlwaysStoppedAnimation(0.0),
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
                                      onPressed: () async {
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
                      duration: Duration(milliseconds: 800),
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
                  : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

class RevolutionWidget extends StatelessWidget {
  const RevolutionWidget({
    super.key,
    required this.textTheme,
    required this.borderLeftColor,
    required this.title,
    required this.description,
    required this.labelBButton,
  });

  final TextTheme textTheme;
  final Color borderLeftColor;
  final String title;
  final String description;
  final String labelBButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white, // Optional: Background color
          border: Border(
            left: BorderSide(
              color: borderLeftColor,
              width: 3.0, // Border width
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 400,
              child: Text(
                title,
                style: textTheme.bodyLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(labelBButton,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    )))
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TabItem({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppColors.primary100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}


// class PartnerWithUsView extends ConsumerStatefulWidget {
//   @override
//   _PartnerWithUsViewState createState() => _PartnerWithUsViewState();
// }

// class _PartnerWithUsViewState extends ConsumerState<PartnerWithUsView> {
//   @override
//   void initState() {
//     super.initState();
//     // Start the auto-scroll
//     ref.read(autoScrollProvider);
//   }

//   @override
//   void dispose() {
//     // Dispose resources
//     ref.read(scrollControllerProvider).dispose();
//     ref.read(autoScrollProvider)?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = ref.watch(scrollControllerProvider);

//     final images = [
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e749b0f798c1705843c_587b518244060909aa603a8b%201.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e74ada842f7f029a81c_587b518e44060909aa603a8c%201-p-500.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661d0c60c8043e14497aba8e_qantas.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7490f97e6d3bd1be01_585e9e12cb11b227491c34fd%201.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e75d0800799b45cc817_5847f199cef1014c0b5e485b%201.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7404100e61ae8a6b69_All_Nippon_Airways_logo_PNG3%201.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e746fb97c3af6c66b45_585e9ddbcb11b227491c34fc%201.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7490f97e6d3bd1be01_585e9e12cb11b227491c34fd%201.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e749b0f798c1705843c_587b518244060909aa603a8b%201.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e74ada842f7f029a81c_587b518e44060909aa603a8c%201-p-500.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/661d0c60c8043e14497aba8e_qantas.png',
//       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/66307e7490f97e6d3bd1be01_585e9e12cb11b227491c34fd%201.png',
//     ];

//     // Infinite loop list by duplicating images
//     final infiniteImages = [...images, ...images]; // Append the list to itself

//     final sizeWidth = MediaQuery.of(context).size.width;
//     final sizeHeight = MediaQuery.of(context).size.height;
//     print('Screen Width $sizeWidth');

//     final textTheme = Theme.of(context).textTheme;

//     final partnerWithUsViewModel = ref.watch(partnerWithUsViewModelProvider);
//     final scrollController = partnerWithUsViewModel.controller;
//     final isScrollingReachTheTop = partnerWithUsViewModel.hasReachedTop;

//     final exploreViewModel = ref.watch(exploreViewModelProvider);

//     exploreViewModel.setCurrentIndexNavBar(3);

//     var isMenuOpen = exploreViewModel.isToggleMenu;

//     final menuToggle = ref.read(exploreViewModelProvider.notifier);

//     Color containerColor = isScrollingReachTheTop ? Colors.transparent : Colors.white;

//     if (sizeWidth > 1126 && isMenuOpen) {
//       isMenuOpen = false;
//     }

//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Scrollbar(
//                 controller: scrollController,
//                 trackVisibility: true,
//                 thumbVisibility: true,
//                 thickness: 12,
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Column(
//                     children: [
//                       Container(
//                           width: double.infinity,
//                           margin: const EdgeInsets.only(right: 15),
//                           alignment: Alignment.bottomCenter,
//                           decoration: const BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                   'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk2MC1uaW5nLTMwLmpwZw.jpg'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Flexible(
//                                 child: Container(
//                                   margin: EdgeInsets.only(
//                                     top: 250,
//                                   ),
//                                   alignment: Alignment.topCenter,
//                                   height: sizeHeight * 0.8,
//                                   child: Padding(
//                                     padding: EdgeInsets.only(left: sizeWidth <= 850 ? 20 : 140),
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             child: Text(
//                                               'Integrate an AI Travel Agent in No Time',
//                                               style: textTheme.bodyLarge?.copyWith(
//                                                 fontSize: sizeWidth <= 590
//                                                     ? 30
//                                                     : sizeWidth <= 1150
//                                                         ? 40
//                                                         : 60,
//                                                 fontWeight: FontWeight.w700,
//                                                 height: 1.5,
//                                               ),
//                                               // textHeightBehavior: TextHeightBehavior(
//                                               //   applyHeightToFirstAscent: false,
//                                               //   applyHeightToLastDescent: true,
//                                               // ),
//                                             ),
//                                           ),
//                                           Container(
//                                             width: sizeWidth * 0.4,
//                                             child: Text(
//                                               'Partner with us to add a cutting-edge AI travel agent to your website – fully operational in under 24 hours.',
//                                               style: textTheme.bodyLarge?.copyWith(
//                                                   fontSize: sizeWidth <= 1150 ? 16 : 22,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.grey),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 80,
//                                           ),
//                                           Container(
//                                             width: sizeWidth * 0.4,
//                                             child: Text(
//                                               'Apply to become a partner of Booked AI Today!',
//                                               style: textTheme.bodyLarge
//                                                   ?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           ElevatedButton.icon(
//                                             onPressed: () {
//                                               // Define your action here
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               fixedSize: Size(150, 40),
//                                               backgroundColor: AppColors.textSecondary, // Button color
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.circular(8), // Rounded corners
//                                               ),
//                                               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                                             ),
//                                             icon: const Text(
//                                               'Apply Now',
//                                               style: TextStyle(color: Colors.white), // Text style
//                                             ),
//                                             label: const Icon(Icons.arrow_forward, color: Colors.white), // Icon
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                     alignment: Alignment.center,
//                                     padding: EdgeInsets.symmetric(vertical: 20),
//                                     margin: EdgeInsets.only(
//                                       top: 250,
//                                     ),
//                                     height: sizeHeight * 0.8,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: NetworkImage(
//                                           'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675682e1ba44cad5541bebdd_cover%20image%20whole%204x.png', // Replace with your image URL
//                                         ),
//                                         fit: BoxFit.contain, // Ensures the image covers the container
//                                       ),
//                                     )),
//                               ),
//                             ],
//                           )),
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal: sizeWidth < 768
//                                 ? 12
//                                 : sizeWidth > 768 && sizeWidth < 1328
//                                     ? 40
//                                     : 140),
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Container(
//                         width: sizeWidth <= 850 ? sizeWidth - 30 : sizeWidth * 0.4,
//                         margin: EdgeInsets.only(right: 15),
//                         child: Column(
//                           children: [
//                             Text(
//                               'What is Booked AI?',
//                               style: textTheme.bodyLarge?.copyWith(
//                                 fontSize: sizeWidth <= 1150 ? 30 : 50,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               'An Around-the-clock Personal AI Travel Agent',
//                               style: textTheme.bodyLarge?.copyWith(
//                                   fontSize: sizeWidth <= 1150 ? 16 : 22,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey),
//                             ),
//                             AspectRatio(
//                               aspectRatio: 8 / 4,
//                               child: CachedNetworkImage(
//                                 fit: BoxFit.cover,
//                                 imageUrl:
//                                     'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6758d76a8e28d31114b9d15a_Frame%201618872751-p-1600.png',
//                                 placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                                 errorWidget: (context, url, error) => const Icon(Icons.error),
//                               ),
//                             ),
//                             Text(
//                               'Booked AI manages your flights, hotels, and itineraries through an easy-to-use chat platform.',
//                               textAlign: TextAlign.center,
//                               style: textTheme.bodyLarge?.copyWith(
//                                   fontSize: sizeWidth <= 1150 ? 16 : 22,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 80,
//                       ),
//                       Container(
//                         width: sizeWidth <= 850 ? sizeWidth - 30 : sizeWidth * 0.8,
//                         margin: EdgeInsets.only(bottom: 20),
//                         child: LayoutBuilder(builder: (context, constraints) {
//                           int numberColumn = 3;

//                           if (sizeWidth < 850) {
//                             numberColumn = 1;
//                           } else if (sizeWidth <= 1250) {
//                             numberColumn = 2;
//                           } else {
//                             numberColumn = 3;
//                           }

//                           return GridView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: numberColumn,
//                                 mainAxisSpacing: 20.0, // Vertical spacing between rows
//                                 crossAxisSpacing: 20.0, // Horizontal spacing between columns
//                                 childAspectRatio: numberColumn == 1
//                                     ? sizeWidth <= 556
//                                         ? 0.85
//                                         : sizeWidth <= 606
//                                             ? 1
//                                             : sizeWidth <= 704
//                                                 ? 1.1
//                                                 : sizeWidth <= 780
//                                                     ? 1.3
//                                                     : 1.4
//                                     : numberColumn == 2
//                                         ? sizeWidth <= 890
//                                             ? 0.58
//                                             : sizeWidth <= 1089
//                                                 ? 0.62
//                                                 : 0.82
//                                         : sizeWidth <= 1345
//                                             ? 0.54
//                                             : sizeWidth <= 1462
//                                                 ? 0.62
//                                                 : sizeWidth <= 1510
//                                                     ? 0.68
//                                                     : sizeWidth <= 1340
//                                                         ? 0.56
//                                                         : 0.75),
//                             itemCount: 3, // Total number of items
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 padding: const EdgeInsets.all(16.0),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.primary50,
//                                   border: Border.all(
//                                     color: Colors.grey.shade600,
//                                     width: 0.1,
//                                   ),
//                                 ),
//                                 child: index == 0
//                                     ? Column(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.symmetric(vertical: 8),
//                                                 margin: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
//                                                 decoration: BoxDecoration(
//                                                   color: AppColors.primary100,
//                                                   borderRadius: BorderRadius.circular(10),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                   children: [
//                                                     TabItem(label: 'Cheapest', isSelected: true),
//                                                     TabItem(label: 'Shortest', isSelected: false),
//                                                     TabItem(label: 'Longest', isSelected: false),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Container(
//                                                 margin: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
//                                                 padding: const EdgeInsets.all(16),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(8),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.grey.withOpacity(0.2),
//                                                       blurRadius: 10,
//                                                       spreadRadius: 2,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 child: Column(
//                                                   children: [
//                                                     Container(
//                                                       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
//                                                       decoration: BoxDecoration(
//                                                         color: Colors.green[100],
//                                                         borderRadius: BorderRadius.circular(12),
//                                                       ),
//                                                       child: Text('Cheapest',
//                                                           style: textTheme.bodyLarge
//                                                               ?.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         Expanded(
//                                                             flex: 3,
//                                                             child: Container(
//                                                               alignment: Alignment.centerLeft,
//                                                               child: CachedNetworkImage(
//                                                                 width: 40,
//                                                                 height: 40,
//                                                                 fit: BoxFit.contain,
//                                                                 imageUrl:
//                                                                     'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6755305d96b1db7483121452_Image.png',
//                                                                 placeholder: (context, url) =>
//                                                                     const Center(child: CircularProgressIndicator()),
//                                                                 errorWidget: (context, url, error) =>
//                                                                     const Icon(Icons.error),
//                                                               ),
//                                                             )),
//                                                         Expanded(
//                                                           flex: 3,
//                                                           child: Container(
//                                                             alignment: Alignment.center,
//                                                             child: Text(
//                                                               '5h 36m',
//                                                               style: textTheme.bodyLarge?.copyWith(fontSize: 12),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         Expanded(
//                                                             flex: 3,
//                                                             child: Container(
//                                                                 alignment: Alignment.centerRight,
//                                                                 child: Text(
//                                                                   'JetStar Airways',
//                                                                   textAlign: TextAlign.end,
//                                                                   style: textTheme.bodyLarge
//                                                                       ?.copyWith(fontSize: 12, color: Colors.grey),
//                                                                 ))),
//                                                       ],
//                                                     ),
//                                                     Column(
//                                                       children: [
//                                                         Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Container(
//                                                                     child: Text(
//                                                                   'Departure',
//                                                                   style: textTheme.bodyLarge
//                                                                       ?.copyWith(fontSize: 12, color: Colors.grey),
//                                                                 ))),
//                                                             Expanded(
//                                                               flex: 3,
//                                                               child: Container(
//                                                                 alignment: Alignment.center,
//                                                                 child: Text(
//                                                                   '1 stop',
//                                                                   style: textTheme.bodyLarge
//                                                                       ?.copyWith(fontSize: 12, color: Colors.grey),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Container(
//                                                                     alignment: Alignment.centerRight,
//                                                                     child: Text(
//                                                                       'Arrival',
//                                                                       style: textTheme.bodyLarge
//                                                                           ?.copyWith(fontSize: 12, color: Colors.grey),
//                                                                     ))),
//                                                           ],
//                                                         ),
//                                                         Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Container(
//                                                                     child: Text(
//                                                                   '09:00',
//                                                                   style: textTheme.bodyLarge?.copyWith(fontSize: 12),
//                                                                 ))),
//                                                             Expanded(
//                                                               flex: 3,
//                                                               child: Container(
//                                                                 alignment: Alignment.center,
//                                                                 child: Text(
//                                                                   'Brisbane',
//                                                                   style: textTheme.bodyLarge?.copyWith(fontSize: 12),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Container(
//                                                                     alignment: Alignment.centerRight,
//                                                                     child: Text(
//                                                                       '14:36',
//                                                                       style:
//                                                                           textTheme.bodyLarge?.copyWith(fontSize: 12),
//                                                                     ))),
//                                                           ],
//                                                         ),
//                                                         Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     child: Text(
//                                                                       'Sydney(SYD)',
//                                                                       style:
//                                                                           textTheme.bodyLarge?.copyWith(fontSize: 12),
//                                                                     ))),
//                                                             Expanded(
//                                                               flex: 3,
//                                                               child: Container(
//                                                                 alignment: Alignment.center,
//                                                                 child: Text(
//                                                                   '3h 00m Transfer',
//                                                                   style: textTheme.bodyLarge?.copyWith(fontSize: 12),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Container(
//                                                                     alignment: Alignment.centerRight,
//                                                                     child: Text(
//                                                                       'Hamilton Island(HTI)',
//                                                                       textAlign: TextAlign.end,
//                                                                       style:
//                                                                           textTheme.bodyLarge?.copyWith(fontSize: 12),
//                                                                     ))),
//                                                           ],
//                                                         ),
//                                                         SizedBox(
//                                                           height: 20,
//                                                         ),
//                                                         Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Column(
//                                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                                   children: [
//                                                                     Container(
//                                                                         child: Text(
//                                                                       '\$99 AUD',
//                                                                       style: textTheme.bodyLarge?.copyWith(
//                                                                           fontSize: 12, fontWeight: FontWeight.bold),
//                                                                     )),
//                                                                     Container(
//                                                                         child: Text(
//                                                                       '\$33 cheaper than average',
//                                                                       style: textTheme.bodyLarge?.copyWith(
//                                                                           fontSize: 10, fontWeight: FontWeight.w600),
//                                                                     )),
//                                                                   ],
//                                                                 )),
//                                                             Expanded(
//                                                                 flex: 3,
//                                                                 child: Container(
//                                                                   alignment: Alignment.centerRight,
//                                                                   child: ElevatedButton(
//                                                                     onPressed: () {},
//                                                                     style: ElevatedButton.styleFrom(
//                                                                       backgroundColor: AppColors.textSecondary,
//                                                                       shape: RoundedRectangleBorder(
//                                                                         borderRadius: BorderRadius.circular(2),
//                                                                       ),
//                                                                     ),
//                                                                     child: FittedBox(
//                                                                       child: Text(
//                                                                         'Select flight',
//                                                                         style: textTheme.bodyLarge?.copyWith(
//                                                                             fontSize: 12, color: Colors.white),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 )),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 20,
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                                                     child: const Text(
//                                                       'Efficient AI Integrated Solution\nAvailable 24/7',
//                                                       style: TextStyle(
//                                                         fontSize: 20,
//                                                         fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     margin: EdgeInsets.symmetric(horizontal: 8),
//                                                     child: const Text(
//                                                       'Streamline travel planning with 24/7 AI powered assistance. Identify the most efficient options for your team, all in real-time.',
//                                                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       )
//                                     : index == 1
//                                         ? Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 margin: EdgeInsets.symmetric(vertical: 60),
//                                                 height: 215,
//                                                 child: SvgPicture.network(
//                                                   fit: BoxFit.contain,
//                                                   'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6656a5284a9bc07d570c5994_earth-map-image.svg',
//                                                 ),
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                                                     child: const Text(
//                                                       'Efficient AI Integrated Solution\nAvailable 24/7',
//                                                       style: TextStyle(
//                                                         fontSize: 20,
//                                                         fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     margin: EdgeInsets.symmetric(horizontal: 8),
//                                                     child: const Text(
//                                                       'Streamline travel planning with 24/7 AI powered assistance. Identify the most efficient options for your team, all in real-time.',
//                                                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           )
//                                         : Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 height: 215,
//                                                 margin: EdgeInsets.symmetric(
//                                                   horizontal: 20,
//                                                   vertical: 30,
//                                                 ),

//                                                 decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.only(
//                                                     topLeft: Radius.circular(20), // Rounded top-left corner
//                                                     topRight: Radius.circular(20), // Rounded top-right corner
//                                                   ),
//                                                 ),
//                                                 clipBehavior:
//                                                     Clip.hardEdge, // Ensures the child respects the border radius
//                                                 child: CachedNetworkImage(
//                                                   imageUrl:
//                                                       'https://blog.italotreno.com/wp-content/uploads/2024/02/Cinque_Terre_sito_unesco.jpg',
//                                                   placeholder: (context, url) => Center(
//                                                     child: CircularProgressIndicator(), // Loader for placeholder
//                                                   ),
//                                                   errorWidget: (context, url, error) => Center(
//                                                     child: Icon(Icons.error, color: Colors.red), // Error widget
//                                                   ),
//                                                   fit: BoxFit.cover, // Adjust image fit inside the container
//                                                 ),
//                                               ),
//                                               Container(
//                                                 margin: EdgeInsets.symmetric(horizontal: 28),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         Row(
//                                                           children: [
//                                                             Icon(Icons.calendar_month),
//                                                             SizedBox(
//                                                               width: 4,
//                                                             ),
//                                                             Text('21 days')
//                                                           ],
//                                                         ),
//                                                         Row(
//                                                           children: [Icon(Icons.location_on), Text('5 Locations')],
//                                                         )
//                                                       ],
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         Row(
//                                                           children: [
//                                                             Icon(Icons.people),
//                                                             SizedBox(
//                                                               width: 4,
//                                                             ),
//                                                             Text('2 Adults')
//                                                           ],
//                                                         ),
//                                                         Row(
//                                                           children: [Icon(Icons.attach_money), Text('21,1890 AUD')],
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                                                     child: const Text(
//                                                       'Custom Travel Itineraries, Designed for Your Clients',
//                                                       style: TextStyle(
//                                                         fontSize: 20,
//                                                         fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     margin: EdgeInsets.symmetric(horizontal: 8),
//                                                     child: const Text(
//                                                       "We build the perfect travel package, tailored to client needs. We handle the heavy lifting, and you're free to make changes anytime.",
//                                                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                               );
//                             },
//                           );
//                         }),
//                       ),
//                       SizedBox(
//                         height: 60,
//                       ),
//                       Container(
//                         width: sizeWidth * 0.8,
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Text(
//                                       'An all-in-one solution to streamline your service',
//                                       style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                     ),
//                                     Row(
//                                       children: [
//                                         CircleAvatar(
//                                           backgroundColor: AppColors.primary100,
//                                           child: Icon(Icons.check, color: AppColors.textSecondary),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Container(
//                                             width: sizeWidth * 0.3,
//                                             child: Text('Automate every step of the travel booking process',
//                                                 style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Row(
//                                       children: [
//                                         CircleAvatar(
//                                           backgroundColor: AppColors.primary100,
//                                           child: Icon(Icons.check, color: AppColors.textSecondary),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Container(
//                                             width: sizeWidth * 0.3,
//                                             child: Text('Reduce manual effort while achieving cost and time savings',
//                                                 style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Row(
//                                       children: [
//                                         CircleAvatar(
//                                           backgroundColor: AppColors.primary100,
//                                           child: Icon(
//                                             Icons.check,
//                                             color: AppColors.textSecondary,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Container(
//                                             width: sizeWidth * 0.3,
//                                             child: Text(
//                                               'Track bookings, spending, and efficiency',
//                                               style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
//                                             )),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 child: CachedNetworkImage(
//                                   fit: BoxFit.cover,
//                                   imageUrl:
//                                       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675670a01b306361a5a9d9f5_All%20in%20one%20solution%20illos.png',
//                                   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                                   errorWidget: (context, url, error) => const Icon(Icons.error),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 60,
//                       ),
//                       Container(
//                         width: sizeWidth * 0.7,
//                         child: Column(
//                           children: [
//                             Text(
//                               'Revolution is ongoing!',
//                               style: textTheme.bodyLarge
//                                   ?.copyWith(fontSize: sizeWidth <= 1150 ? 30 : 50, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Set up and operational within 24 hours',
//                               textScaleFactor: 1.2,
//                               style: textTheme.bodyLarge?.copyWith(
//                                   fontSize: sizeWidth <= 1150 ? 16 : 22,
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             Row(
//                               children: [
//                                 RevolutionWidget(
//                                   textTheme: textTheme,
//                                   borderLeftColor: AppColors.textSecondary,
//                                   labelBButton: 'Live now',
//                                   title: 'Access to an extensive portfolio of over 2,000 hotels globally',
//                                   description:
//                                       "Discover premium accommodations worldwide, from boutique stays to luxurious hotels, with options to suit every traveler's needs. Enjoy exclusive rates, seamless booking, and personalized recommendations for your perfect stay.",
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 RevolutionWidget(
//                                   textTheme: textTheme,
//                                   borderLeftColor: Colors.blue,
//                                   labelBButton: 'Coming soon',
//                                   title: 'Seamless car rental booking services across the globe',
//                                   description:
//                                       'Effortlessly arrange your transportation with trusted car rental providers worldwide. Whether for road trip adventures or business reception, find the ideal vehicle for your journey with competitive pricing and flexible options.',
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Row(
//                               children: [
//                                 RevolutionWidget(
//                                   textTheme: textTheme,
//                                   borderLeftColor: AppColors.textSecondary,
//                                   labelBButton: 'Live now',
//                                   title: 'Partnerships with over 300 international and regional airlines',
//                                   description:
//                                       "Simplify air travel with access to global and regional flight options. Book, modify, or upgrade with ease, supported by our extensive airline partnerships designed to offer convenience and competitive fares.",
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 RevolutionWidget(
//                                   textTheme: textTheme,
//                                   borderLeftColor: Colors.blue,
//                                   labelBButton: 'Coming soon',
//                                   title: 'Cruise booking solutions across leading providers',
//                                   description:
//                                       'Navigate the seas with ease through our partnerships with top cruise lines. Discover tailored itineraries, luxurious amenities, and exclusive packages for an unforgettable ocean adventure.',
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Row(
//                               children: [
//                                 RevolutionWidget(
//                                   textTheme: textTheme,
//                                   borderLeftColor: AppColors.textSecondary,
//                                   labelBButton: 'Live now',
//                                   title: 'Comprehensive offerings of trips and activities worldwide',
//                                   description:
//                                       "Explore a world of possibilities with curated experiences tailored to every interest. From guided tours to adventure activities, enhance your journey with memorable moments wherever you travel.",
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 RevolutionWidget(
//                                   textTheme: textTheme,
//                                   borderLeftColor: Colors.blue,
//                                   labelBButton: 'Coming soon',
//                                   title: 'Restaurant reservations tailored to your destination preferences',
//                                   description:
//                                       'Savor your travels with handpicked dining experiences at top restaurants. From local delicacies to fine dining, we help you secure reservations that elevate your culinary journey.',
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 60,
//                       ),
//                       Container(
//                         width: sizeWidth * 0.8,
//                         child: Column(
//                           children: [
//                             Text(
//                               'Who is it for?',
//                               style: textTheme.bodyLarge
//                                   ?.copyWith(fontSize: sizeWidth <= 1150 ? 30 : 50, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'Any Travel Industry Players',
//                               textScaleFactor: 1.2,
//                               style: textTheme.bodyLarge?.copyWith(
//                                   fontSize: sizeWidth <= 1150 ? 16 : 22,
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             Container(
//                               width: sizeWidth <= 850 ? sizeWidth - 30 : sizeWidth * 0.8,
//                               margin: EdgeInsets.only(bottom: 20),
//                               child: LayoutBuilder(builder: (context, constraints) {
//                                 int numberColumn = 3;

//                                 if (sizeWidth < 850) {
//                                   numberColumn = 1;
//                                 } else if (sizeWidth <= 1250) {
//                                   numberColumn = 2;
//                                 } else {
//                                   numberColumn = 3;
//                                 }

//                                 return GridView.builder(
//                                   shrinkWrap: true,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: numberColumn,
//                                       mainAxisSpacing: 20.0, // Vertical spacing between rows
//                                       crossAxisSpacing: 20.0, // Horizontal spacing between columns
//                                       childAspectRatio: numberColumn == 1
//                                           ? sizeWidth <= 567
//                                               ? 0.7
//                                               : sizeWidth <= 585
//                                                   ? 0.9
//                                                   : sizeWidth <= 606
//                                                       ? 1
//                                                       : sizeWidth <= 704
//                                                           ? 1
//                                                           : sizeWidth <= 780
//                                                               ? 1.2
//                                                               : 1.3
//                                           : numberColumn == 2
//                                               ? sizeWidth <= 890
//                                                   ? 0.58
//                                                   : sizeWidth <= 1089
//                                                       ? 0.62
//                                                       : 0.82
//                                               : sizeWidth <= 1345
//                                                   ? 0.54
//                                                   : sizeWidth <= 1462
//                                                       ? 0.62
//                                                       : sizeWidth <= 1510
//                                                           ? 0.68
//                                                           : sizeWidth <= 1340
//                                                               ? 0.56
//                                                               : 0.75),
//                                   itemCount: ref.watch(whosIsItForProvider).length,
//                                   itemBuilder: (context, index) {
//                                     final data = ref.watch(whosIsItForProvider)[index];

//                                     return Column(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(20), // Rounded corners
//                                           child: CachedNetworkImage(
//                                             height: 250,
//                                             width: sizeWidth,
//                                             imageUrl: data['image'] ?? '',
//                                             fit: BoxFit.cover,
//                                             placeholder: (context, url) => Center(
//                                               child: CircularProgressIndicator(),
//                                             ),
//                                             errorWidget: (context, url, error) => Center(
//                                               child: Icon(Icons.error, color: Colors.red),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         Text(
//                                           data['title'] ?? '',
//                                           style:
//                                               textTheme.bodyLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         Text(
//                                           data['description'] ?? '',
//                                           style: textTheme.bodyLarge
//                                               ?.copyWith(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         TextButton(
//                                             onPressed: () {},
//                                             child: Text(data['labelButton'] ?? '',
//                                                 style: textTheme.bodyLarge?.copyWith(
//                                                   color: AppColors.textSecondary,
//                                                 )))
//                                       ],
//                                     );
//                                   },
//                                 );
//                               }),
//                             ),
//                           ],
//                         ),
//                       ),

//                       SizedBox(
//                         height: 60,
//                       ),
//                       Container(
//                         width: sizeWidth * 0.8,
//                         child: Column(
//                           children: [
//                             Text(
//                               'How can we help?',
//                               style: textTheme.bodyLarge
//                                   ?.copyWith(fontSize: sizeWidth <= 1150 ? 30 : 50, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Eliminate the Mundane, Focus on the Fun',
//                               textScaleFactor: 1.2,
//                               style: textTheme.bodyLarge?.copyWith(
//                                   fontSize: sizeWidth <= 1150 ? 16 : 22,
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           'A white-labelled solution to streamline your service',
//                                           style:
//                                               textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(
//                                           height: 40,
//                                         ),
//                                         Row(
//                                           children: [
//                                             CircleAvatar(
//                                               backgroundColor: AppColors.primary100,
//                                               child: Icon(Icons.check, color: AppColors.textSecondary),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Container(
//                                                 width: sizeWidth * 0.3,
//                                                 child: Text('Seamless website integration',
//                                                     style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         Row(
//                                           children: [
//                                             CircleAvatar(
//                                               backgroundColor: AppColors.primary100,
//                                               child: Icon(Icons.check, color: AppColors.textSecondary),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Container(
//                                                 width: sizeWidth * 0.3,
//                                                 child: Text('White-labelled web / mobile app',
//                                                     style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         Row(
//                                           children: [
//                                             CircleAvatar(
//                                               backgroundColor: AppColors.primary100,
//                                               child: Icon(
//                                                 Icons.check,
//                                                 color: AppColors.textSecondary,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Container(
//                                                 width: sizeWidth * 0.3,
//                                                 child: Text(
//                                                   'Around the clock support',
//                                                   style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
//                                                 )),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     child: CachedNetworkImage(
//                                       fit: BoxFit.cover,
//                                       imageUrl:
//                                           'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/675670e7b6abaf4005891658_Frame%201618872745-p-800.png',
//                                       placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                                       errorWidget: (context, url, error) => const Icon(Icons.error),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 60,
//                       ),

//                       Container(
//                         width: sizeWidth * 0.8,
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 child: Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                       children: [
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a40fdfd457aa207efce_Picture.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a40dd6a0b5be892b536_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                       children: [
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a42459d4f94fde736b3_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a42459d4f94fde736b3_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a43f750e749d6f313e8_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a43f750e749d6f313e8_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a448fbfdf1231bfae6b_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a454bf77fc8e30ac210_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                       children: [
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a46459d4f94fde73c8e_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         CachedNetworkImage(
//                                           width: 130,
//                                           fit: BoxFit.cover,
//                                           imageUrl:
//                                               'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/67557a468c7e96ec0c074011_image.png',
//                                           placeholder: (context, url) =>
//                                               const Center(child: CircularProgressIndicator()),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )),
//                             SizedBox(
//                               width: 40,
//                             ),
//                             Expanded(
//                                 child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Open doorways to the unexplored',
//                                     style: textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     'Booked AI can bring you and your customers the unthinkable. With our data from thousands of real travellers,  we can bring the most authentic hidden gems in front of your eyes.',
//                                     style:
//                                         textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
//                                   ),
//                                   SizedBox(
//                                     height: 30,
//                                   ),
//                                   FittedBox(
//                                     child: TextButton.icon(
//                                       onPressed: () {
//                                         // Define your action here
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         fixedSize: Size(280, 40),
//                                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                                       ),
//                                       icon: const Text(
//                                         'Explore our top destinations',
//                                         style: TextStyle(fontSize: 18, color: AppColors.textSecondary), // Text style
//                                       ),
//                                       label: const Icon(Icons.arrow_forward, color: AppColors.textSecondary), // Icon
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ))
//                           ],
//                         ),
//                       ),

//                       SizedBox(
//                         height: 60,
//                       ),

//                       Container(
//                         height: 100,
//                         margin: EdgeInsets.only(right: 15),
//                         child: ListView.builder(
//                           controller: controller,
//                           scrollDirection: Axis.horizontal,
//                           itemCount: infiniteImages.length, // Number of images
//                           itemBuilder: (context, index) {
//                             return Container(
//                               width: 150,
//                               height: 60, // Fixed width for each image
//                               margin: EdgeInsets.symmetric(horizontal: 16.0),
//                               child: Image.network(
//                                 infiniteImages[index % images.length],
//                                 color: Colors.grey,
//                               ),
//                             );
//                           },
//                         ),
//                       ),

//                       // Container(
//                       //   height: 180,
//                       //   margin: EdgeInsets.only(right: 15),
//                       //   child: ScrollLoopAutoScroll(
//                       //       child: Row(
//                       //         children: [
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[0],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[1],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[2],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[3],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[4],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[5],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[6],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[7],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[8],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //           Container(
//                       //             width: 200,
//                       //             height: 80, // Fixed width for each image
//                       //             margin: EdgeInsets.symmetric(horizontal: 16.0),
//                       //             child: Image.network(
//                       //               images[9],
//                       //               color: Colors.grey,
//                       //             ),
//                       //           ),
//                       //         ],
//                       //       ),
//                       //       scrollDirection: Axis.horizontal, //required
//                       //       delay: Duration(seconds: 1),
//                       //       duration: Duration(seconds: 1),
//                       //       gap: 25,
//                       //       reverseScroll: true,
//                       //       duplicateChild: 15,
//                       //       enableScrollInput: true,
//                       //       delayAfterScrollInput: Duration(seconds: 3)),
//                       // ),
//                       SizedBox(
//                         height: 60,
//                       ),

//                       //Footer
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.all(20.0),
//                         margin: const EdgeInsets.only(right: 15),
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk2MC1uaW5nLTMwLmpwZw.jpg',
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: Wrap(
//                           alignment: WrapAlignment.spaceAround,
//                           runAlignment: WrapAlignment.spaceAround,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.only(left: 12),
//                               margin: const EdgeInsets.symmetric(vertical: 10),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Sign up for our news letter',
//                                       textAlign: TextAlign.start,
//                                       style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 20)),
//                                   const Text('Be thee first to know about releases and industry news and insights',
//                                       textAlign: TextAlign.start),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.symmetric(vertical: 10),
//                               child: Wrap(
//                                 runSpacing: 12,
//                                 spacing: 10,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width < 850 ? double.infinity : 500,
//                                     child: TextField(
//                                       //onChanged: (value) => ref.read(emailProvider.notifier).state = value,
//                                       decoration: InputDecoration(
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         labelText: 'Email',
//                                         labelStyle: const TextStyle(color: Colors.grey),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: const BorderSide(color: Colors.grey),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: const BorderSide(color: Colors.grey),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: const BorderSide(color: Colors.blue),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 45,
//                                     width: MediaQuery.of(context).size.width < 850 ? double.infinity : 150,
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         // Action for the Subscribe button
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: AppColors.textSecondary,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                         ),
//                                       ),
//                                       child: Text(
//                                         'Subscribe',
//                                         style: textTheme.bodyLarge?.copyWith(color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       FooterWidget(textTheme: textTheme),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       margin: const EdgeInsets.only(right: 15),
//                       padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10),
//                       color: AppColors.primary,
//                       child: HolidayDealsWidget(textTheme: textTheme),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         AnimatedContainer(
//                           duration: const Duration(milliseconds: 800),
//                           margin: const EdgeInsets.only(right: 15),
//                           height: 100,
//                           color: containerColor,
//                           child: Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: MediaQuery.of(context).size.width < 850
//                                     ? 12
//                                     : MediaQuery.of(context).size.width < 1210
//                                         ? 100
//                                         : 140),
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   height: 60,
//                                   child: Image.network(
//                                       'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6711d4c2add268ab486ba5e2_Logo%20(7)-p-500.png'),
//                                 ),
//                                 const Expanded(child: SizedBox()),
//                                 MediaQuery.of(context).size.width <= 1126
//                                     ? IconButton(
//                                         icon: AnimatedIcon(
//                                           icon: AnimatedIcons.menu_close,
//                                           progress:
//                                               isMenuOpen ? AlwaysStoppedAnimation(1.0) : AlwaysStoppedAnimation(0.0),
//                                         ),
//                                         onPressed: () => menuToggle.toggleMenu(),
//                                       )
//                                     : NavBarWidget(textTheme: textTheme),
//                                 const SizedBox(
//                                   width: 16,
//                                 ),
//                                 sizeWidth <= 1126
//                                     ? const SizedBox()
//                                     : ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: AppColors.textSecondary,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                                         ),
//                                         onPressed: () async {
//                                           final FirebaseFirestore firestore = FirebaseFirestore.instance;
//                                           final CollectionReference exploreCollection =
//                                               firestore.collection('explores');

//                                           const String chars =
//                                               'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
//                                           final Random random = Random();
//                                           var id =
//                                               List.generate(20, (index) => chars[random.nextInt(chars.length)]).join();

//                                           // Sample data for 5 explores
//                                           final List<ExploreModel> explores = [
//                                             ExploreModel(
//                                               id: id,
//                                               image: '',
//                                               title: 'Explore the Mountains',
//                                               description: 'A thrilling experience in the mountains.',
//                                               location: 'Himalayas',
//                                               activity: 'Hiking',
//                                               userName: 'John Doe',
//                                               userImage: 'https://example.com/images/johndoe.png',
//                                               createdAt: DateTime.now(),
//                                             ),
//                                             ExploreModel(
//                                               id: id,
//                                               image: '',
//                                               title: 'City Lights Adventure',
//                                               description: 'Discover the beauty of urban landscapes.',
//                                               location: 'New York',
//                                               activity: 'City Tour',
//                                               userName: 'Jane Smith',
//                                               userImage: 'https://example.com/images/janesmith.png',
//                                               createdAt: DateTime.now(),
//                                             ),
//                                             ExploreModel(
//                                               id: id,
//                                               image: '',
//                                               title: 'Beach Bliss',
//                                               description: 'Relax at the serene beaches.',
//                                               location: 'Maldives',
//                                               activity: 'Beach Relaxation',
//                                               userName: 'Alex Johnson',
//                                               userImage: 'https://example.com/images/alexjohnson.png',
//                                               createdAt: DateTime.now(),
//                                             ),
//                                             ExploreModel(
//                                               id: id,
//                                               image: '',
//                                               title: 'Safari Adventure',
//                                               description: 'Experience the thrill of a safari.',
//                                               location: 'Africa',
//                                               activity: 'Safari',
//                                               userName: 'Chris Lee',
//                                               userImage: 'https://example.com/images/chrislee.png',
//                                               createdAt: DateTime.now(),
//                                             ),
//                                             // ExploreModel(
//                                             //   id: id,
//                                             //image: '',
//                                             //   title: 'Cultural Exploration',
//                                             //   description: 'Immerse yourself in local cultures.',
//                                             //   location: 'Japan',
//                                             //   activity: 'Cultural Tour',
//                                             //   userName: 'Emily Davis',
//                                             //   userImage: 'https://example.com/images/emilydavis.png',
//                                             //   createdAt: DateTime.now(),
//                                             // ),
//                                           ];

//                                           try {
//                                             // Add each explore to Firestore
//                                             for (var explore in explores) {
//                                               await exploreCollection.add(explore.toJson());
//                                             }
//                                             print('Explores added successfully!');
//                                           } catch (e) {
//                                             print('Error adding explores: $e');
//                                           }
//                                         },
//                                         child: Text(
//                                           'Get the BETA',
//                                           style: textTheme.bodyLarge?.copyWith(color: Colors.white),
//                                         )),
//                               ],
//                             ),
//                           ),
//                         ),
//                         MenuBarWidget(isMenuOpen: isMenuOpen, textTheme: textTheme, sizeWidth: sizeWidth),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));

//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text("Auto Scrolling Images"),
//     //   ),
//     //   body: Container(
//     //     height: 150, // Fixed height for the horizontal list
//     //     child: ListView.builder(
//     //       controller: controller,
//     //       scrollDirection: Axis.horizontal,
//     //       itemCount: images.length, // Number of images
//     //       itemBuilder: (context, index) {
//     //         return Container(
//     //           width: 200,
//     //           height: 100, // Fixed width for each image
//     //           margin: EdgeInsets.symmetric(horizontal: 8.0),
//     //           child: Image.network(images[index]),
//     //         );
//     //       },
//     //     ),
//     //   ),
//     // );
//   }
// }
