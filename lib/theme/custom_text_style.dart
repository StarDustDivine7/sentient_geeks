import 'package:sentiangreeks_task/core/exports.dart';

class CustomTextStyle {
  static montserratBold({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 22,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.textColor,
      fontFamily: "Montserrat-Bold",
    );
  }

  static poppinsRegular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.textColor,
      fontFamily: "Poppins-Regular",
    );
  }

  static robotoRegular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w500,
      letterSpacing: 0.8,
      color: color ?? AppColors.textColor,
      fontFamily: "Roboto_Condensed-Regular",
    );
  }

  static interRegular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? AppColors.textColor,
      decoration: decoration,
      letterSpacing: 1,
      fontFamily: "Inter_18pt-Regular",
    );
  }

  static lobsterRegular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? AppColors.textColor,
      decoration: decoration,
      letterSpacing: 1,
      fontFamily: "Lobster-Regular",
    );
  }
}
