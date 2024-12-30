import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/views/explore/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../view_models/explore_view_model.dart';

class FooterWidget extends ConsumerWidget {
  const FooterWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
                ),
                Container(
                  width: 700,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: NavBarWidget(textTheme: textTheme),
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
                      })),
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            height: 1,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width < 850 ? 32 : 160),
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
    );
  }
}
