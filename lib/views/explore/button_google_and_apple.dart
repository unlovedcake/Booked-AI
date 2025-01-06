import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonGoogleAndApple extends StatelessWidget {
  const ButtonGoogleAndApple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      child: Wrap(
        spacing: 20,
        children: [
          InkWell(
            onTap: () async {
              final Uri url = Uri.parse('https://apps.apple.com/au/app/booked-ai/id6473001180');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $url';
              }
            },
            child: SvgPicture.network(
              fit: BoxFit.cover,
              'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6613ccc0821e816951d67ff4_googleplay.svg',
            ),
          ),
          InkWell(
            onTap: () async {
              final Uri url = Uri.parse('https://apps.apple.com/au/app/booked-ai/id6473001180');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $url';
              }
            },
            child: SvgPicture.network(
              fit: BoxFit.cover,
              'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15/6613ccd51e501225d2fb36c6_appstore.svg',
            ),
          ),
        ],
      ),
    );
  }
}
