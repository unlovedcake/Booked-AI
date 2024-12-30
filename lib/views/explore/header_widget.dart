import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
    required this.textTheme,
    required this.heightOfContainer,
    required this.title,
    required this.description,
    this.widget,
  });

  final TextTheme textTheme;
  final double heightOfContainer;
  final String title;
  final String description;
  Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: heightOfContainer,
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
              height: 100,
            ),
            Text(
              title,
              textScaler: const TextScaler.linear(1.1),
              style: textTheme.bodyLarge?.copyWith(fontSize: 35, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textScaler: const TextScaler.linear(1.1),
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey.shade700),
              ),
            ),
            if (widget != null) Container(margin: EdgeInsets.only(top: 40, left: 20, right: 20), child: widget!),
          ],
        ));
  }
}
