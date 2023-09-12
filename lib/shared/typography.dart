import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTyography {
  static TextStyle headline_900({
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: fontWeight == FontWeight.bold ? 56.sp : 48.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headline_800() {
    return TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle headline_700() {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle headline_600() {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle headline_500() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle headline_400() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle headline_300() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle headline_200() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle headline_100() {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bodyText_300() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bodyText_200() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bodyText_100() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
