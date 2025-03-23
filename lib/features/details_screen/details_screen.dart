import 'dart:ui';

import 'package:hive_flutter/adapters.dart';
import 'package:sentiangreeks_task/features/details_screen/widget/overview_row_component.dart';

import '../../core/exports.dart';
import '../../widgets/glass_background_component.dart';

class DetailsScreen extends StatelessWidget {
  final String imagePath, name, location;
  const DetailsScreen({
    super.key,
    required this.imagePath,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final likedPostsBox = Hive.box('likedPosts');
    final likedPosts = likedPostsBox.values.toList();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 8,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    height: 460,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 15,
                                      sigmaY: 15,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: AppColors.lightGrayTextColor
                                            .withAlpha(95),
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 15,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 15,
                                    sigmaY: 15,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: AppColors.lightGrayTextColor
                                          .withAlpha(95),
                                    ),
                                    child: Image.asset(
                                      "${ImageConstant.iconPath}/Vector_book.png",
                                      width: 22,
                                      height: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          GlassBackgroundComponent(
                            name: name,
                            location: location,
                            topRightText: "Price",
                            bottomRightWidget: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "\$",
                                    style: CustomTextStyle.robotoRegular(
                                      color: AppColors.glassRightText,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "230",
                                    style: CustomTextStyle.robotoRegular(
                                      color: AppColors.whiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                gapH32,
                Row(
                  spacing: 20,
                  children: [
                    Text(
                      "Overview",
                      style: CustomTextStyle.interRegular(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Details",
                      style: CustomTextStyle.interRegular(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.lightGrayTextColor,
                      ),
                    ),
                  ],
                ),

                gapH24,

                Row(
                  children: [
                    OverviewRowComponent(
                      title: "8 hours",
                      imagePath: "${ImageConstant.iconPath}/time.png",
                    ),

                    Spacer(),
                    OverviewRowComponent(
                      title: "16°C",
                      imagePath: "${ImageConstant.iconPath}/icon cloud.png",
                    ),

                    Spacer(),
                    OverviewRowComponent(
                      title: "4.5",
                      imagePath: "${ImageConstant.iconPath}/Vector_star.png",
                    ),
                  ],
                ),
                gapH24,
                Text(
                  "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to ",
                  style: CustomTextStyle.robotoRegular(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.whiteColor.withOpacity(0.9),
                    blurRadius: 85,
                    spreadRadius: 85,
                  ),
                ],
              ),
            ),
          ),

          BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                width: double.maxFinite,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Book Now",
                        style: CustomTextStyle.robotoRegular(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      gapW12,
                      Image.asset(
                        "${ImageConstant.iconPath}/send icon.png",
                        height: 23,
                        width: 23,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
