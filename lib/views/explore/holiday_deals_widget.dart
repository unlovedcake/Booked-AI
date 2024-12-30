import 'package:booked_ai/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HolidayDealsWidget extends StatelessWidget {
  const HolidayDealsWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
      ],
    );
  }
}
