import 'package:booked_ai/themes/app_colors.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
  });

  final double sizeWidth;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}
