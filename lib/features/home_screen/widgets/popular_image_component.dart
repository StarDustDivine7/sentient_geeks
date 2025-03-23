import 'dart:ui';

import 'package:sentiangreeks_task/features/details_screen/details_screen.dart';

import '../../../core/exports.dart';
import '../../../widgets/glass_background_component.dart';

class PopularImageComponent extends StatelessWidget {
  const PopularImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List popularImage = [
      {
        "image": "${ImageConstant.imagePath}/Mask group.png",
        "name": "Mount Fuji, Tokyo",
        "location": "Tokyo, Japan",
        "rating": "4.8",
      },
      {
        "image": "${ImageConstant.imagePath}/image 168.png",
        "name": "Andes Mountain",
        "location": "South, America",
        "rating": "4.2",
      },
    ];
    return SizedBox(
      height: 430,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: popularImage.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: 15);
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(35),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => DetailsScreen(
                        imagePath: popularImage[index]['image'],
                        name: popularImage[index]['name'],
                        location: popularImage[index]['location'],
                      ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(30).copyWith(top: 0, left: 0, right: 0),
              child: Card(
                surfaceTintColor: AppColors.whiteColor,
                color: AppColors.whiteColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 270,
                    height: 405,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(popularImage[index]['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: AppColors.lightGrayTextColor.withAlpha(
                                    95,
                                  ),
                                ),
                                child: Image.asset(
                                  "${ImageConstant.iconPath}/heart icon.png",
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GlassBackgroundComponent(
                            name: popularImage[index]['name'],
                            location: popularImage[index]['location'],
                            bottomRightWidget: Row(
                              children: [
                                Icon(
                                  Icons.star_border_outlined,
                                  size: 15,
                                  color: AppColors.glassRightText,
                                ),
                                gapW8,
                                Text(
                                  popularImage[index]['rating'],
                                  style: CustomTextStyle.robotoRegular(
                                    color: AppColors.glassRightText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15),
                          //   child: BackdropFilter(
                          //     filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          //     child: Container(
                          //       width: double.maxFinite,
                          //       padding: EdgeInsets.symmetric(horizontal: 10),
                          //       height: 75,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15),
                          //         color: AppColors.primaryColor.withAlpha(90),
                          //       ),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             popularImage[index]['name'],
                          //             style: CustomTextStyle.robotoRegular(
                          //               color: AppColors.whiteColor,
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.w500,
                          //             ),
                          //           ),
                          //           gapH8,
                          //           Row(
                          //             children: [
                          //               Image.asset(
                          //                 "${ImageConstant.iconPath}/fi-rr-marker.png",
                          //                 width: 16,
                          //                 height: 16,
                          //               ),
                          //               gapW12,
                          //               Text(
                          //                 popularImage[index]['location'],
                          //                 style: CustomTextStyle.robotoRegular(
                          //                   color: AppColors.whiteColor,
                          //                 ),
                          //               ),
                          //               Spacer(),
                          //               Icon(
                          //                 Icons.star_border_outlined,
                          //                 size: 15,
                          //                 color: AppColors.whiteColor,
                          //               ),
                          //               gapW8,
                          //               Text(
                          //                 popularImage[index]['rating'],
                          //                 style: CustomTextStyle.robotoRegular(
                          //                   color: AppColors.whiteColor,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
