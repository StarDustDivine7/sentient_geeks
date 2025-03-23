import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive/hive.dart';
import 'package:sentiangreeks_task/core/exports.dart';
import 'package:sentiangreeks_task/features/search_screen/provider/search_bloc.dart';
import 'package:sentiangreeks_task/features/search_screen/provider/search_event.dart';
import 'package:sentiangreeks_task/features/search_screen/provider/search_state.dart';
import 'package:sentiangreeks_task/features/search_screen/widget/custom_dialog_box.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late SearchBloc _searchBloc;
  late Box likedPostsBox;

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc();
    _searchBloc.add(FetchSearchResults(query: ""));
    likedPostsBox = Hive.box('likedPosts');
  }

  void _isLike(String title, String body) {
    final key = generateKey(title, body);

    setState(() {
      if (likedPostsBox.containsKey(key)) {
        likedPostsBox.delete(key);
      } else {
        likedPostsBox.put(key, {'title': title, 'body': body});
      }
    });
  }

  String generateKey(String title, String body) {
    return md5.convert(utf8.encode("$title|$body")).toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _searchBloc,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          centerTitle: true,
          title: Text("Search ", style: CustomTextStyle.montserratBold()),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: TextFormField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                onChanged: (query) {
                  _searchBloc.add(
                    FetchSearchResults(query: _searchController.text),
                  );
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColors.lightGrayTextColor,
                  ),
                  hintText: "Search by query",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(child: _loadingShimmerEffect());
                  } else if (state is SearchLoaded) {
                    return AnimationLimiter(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: state.searchResponse.posts.length,
                        itemBuilder: (context, index) {
                          final post = state.searchResponse.posts[index];
                          final key = generateKey(post.title, post.body);
                          final isLiked = likedPostsBox.containsKey(key);
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder:
                                    (context) =>
                                        CustomDialog(title: post.title),
                              );
                            },
                            child: AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 600),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: AppColors.lightGrayTextColor
                                          .withAlpha(35),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 7,
                                              // width: 270,
                                              child: Text(
                                                post.title,
                                                style:
                                                    CustomTextStyle.montserratBold(
                                                      fontSize: 15,
                                                    ),
                                              ),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                              onTap: () {
                                                _isLike(post.title, post.body);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Image.asset(
                                                  isLiked
                                                      ? "${ImageConstant.iconPath}/heart_fill.png"
                                                      : "${ImageConstant.iconPath}/heart.png",
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        gapH8,
                                        Text(
                                          post.body,
                                          maxLines: 7,
                                          style: CustomTextStyle.poppinsRegular(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loadingShimmerEffect() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Shimmer.fromColors(
            baseColor: AppColors.lightGrayTextColor.withAlpha(45),
            highlightColor: AppColors.lightGrayTextColor.withAlpha(20),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }
}
