import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({
    super.key,
    required this.sizeWidth,
    required this.textTheme,
    required this.storageKey,
  });

  final double sizeWidth;
  final TextTheme textTheme;
  final String storageKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exploreViewModel = ref.watch(exploreViewModelProvider);

    return exploreViewModel.isLoading
        ? const Center(child: CircularProgressIndicator())
        : exploreViewModel.errorMessage != null
            ? Center(child: Text('Error: ${exploreViewModel.errorMessage}'))
            : GridView.builder(
                key: PageStorageKey(storageKey),
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
                          : 0.61,
                ),
                itemCount: exploreViewModel.exploreList.length,
                itemBuilder: (context, index) {
                  final explore = exploreViewModel.exploreList[index];
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
                          const SizedBox(
                            height: 22,
                          ),
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: explore.image,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  explore.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    explore.description,
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
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, color: Colors.grey, size: 26),
                                    const SizedBox(width: 6),
                                    Text(
                                      explore.location,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.card_giftcard, color: Colors.grey, size: 26),
                                    const SizedBox(width: 6),
                                    Text(
                                      explore.activity,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(explore.userImage),
                                  ),
                                  title: Text(
                                    explore.userName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: const Text('3 min read'),
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
