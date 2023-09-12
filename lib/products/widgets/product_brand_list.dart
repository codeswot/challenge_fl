import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBrandList extends StatelessWidget {
  const ProductBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.only(
        left: 30.w,
        bottom: 30.h,
      ),
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.only(right: 20.w),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
