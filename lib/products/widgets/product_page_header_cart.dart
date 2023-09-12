import 'package:challenge_fl/shared/shared.dart';
import 'package:challenge_fl/shared/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductPageHeaderCart extends StatelessWidget {
  const ProductPageHeaderCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 31.w,
        right: 30.w,
        bottom: 24.h,
        top: 30.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Discover",
            style: AppTyography.headline_700().copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.cartIcon),
          ),
        ],
      ),
    );
  }
}
