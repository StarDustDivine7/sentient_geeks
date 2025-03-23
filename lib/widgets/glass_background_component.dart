import 'dart:ui';

import '../core/exports.dart';

class GlassBackgroundComponent extends StatelessWidget {
  const GlassBackgroundComponent({
    super.key,
    required this.name,
    required this.location,
    this.topRightText,
    this.bottomRightWidget,
  });

  final String name;
  final String location;
  final String? topRightText;
  final Widget? bottomRightWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primaryColor.withAlpha(90),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: CustomTextStyle.robotoRegular(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  if (topRightText != null)
                    Text(
                      topRightText!,
                      style: CustomTextStyle.robotoRegular(
                        color: AppColors.glassRightText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
              gapH8,
              Row(
                children: [
                  Image.asset(
                    "${ImageConstant.iconPath}/fi-rr-marker.png",
                    width: 16,
                    height: 16,
                    color: AppColors.glassRightText,
                  ),
                  gapW12,
                  Text(
                    location,
                    style: CustomTextStyle.robotoRegular(
                      color: AppColors.glassRightText,
                    ),
                  ),
                  Spacer(),
                  if (bottomRightWidget != null) bottomRightWidget!,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
