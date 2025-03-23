import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/exports.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({super.key});

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  late Box likedPostsBox;

  @override
  void initState() {
    super.initState();
    likedPostsBox = Hive.box('likedPosts');
  }

  void _removeFavorite(String key) {
    setState(() {
      likedPostsBox.delete(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    final likedPostsBox = Hive.box('likedPosts');
    final likedPosts = likedPostsBox.values.toList();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Favorite ",
          style: CustomTextStyle.montserratBold(fontSize: 18),
        ),
      ),
      body:
          likedPosts.isEmpty
              ? Center(
                child: Text(
                  "No Favorites Yet",
                  style: CustomTextStyle.montserratBold(),
                ),
              )
              : AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: likedPostsBox.length,
                  itemBuilder: (context, index) {
                    final key = likedPostsBox.keyAt(index);
                    final post = likedPostsBox.get(key);
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withAlpha(35),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        post['title'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: AppColors.primaryColor,
                                      ),
                                      onPressed: () => _removeFavorite(key),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  post['body'],
                                  maxLines: 7,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
