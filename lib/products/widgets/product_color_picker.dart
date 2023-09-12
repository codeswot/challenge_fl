import 'package:challenge_fl/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductColorPicker extends StatelessWidget {
  const ProductColorPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.fakeColorPicker,
      width: 150.w,
      height: 60.h,
    );
  }
}
