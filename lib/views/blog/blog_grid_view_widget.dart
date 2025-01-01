import 'package:booked_ai/themes/app_colors.dart';
import 'package:booked_ai/view_models/blog_view_model.dart';
import 'package:booked_ai/view_models/explore_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogGridViewWidget extends ConsumerWidget {
  const BlogGridViewWidget({
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
    final blogViewModel = ref.watch(blogViewModelProvider);

    return blogViewModel.isLoading
        ? const Center(child: CircularProgressIndicator())
        : blogViewModel.errorMessage != null
            ? Center(child: Text('Error: ${blogViewModel.errorMessage}'))
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
                      ? 0.94
                      : sizeWidth > 768 && sizeWidth <= 1000
                          ? 0.8
                          : 0.7,
                ),
                itemCount: blogViewModel.blogs.length,
                itemBuilder: (context, index) {
                  final explore = blogViewModel.blogs[index];
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
                          AspectRatio(
                            aspectRatio: 4 / 3,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: explore.image,
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
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
                                SizedBox(
                                  height: 2,
                                ),
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
