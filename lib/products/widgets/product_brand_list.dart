import 'package:challenge_fl/shared/shared.dart';
import 'package:challenge_fl/shared/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBrandList extends StatefulWidget {
  const ProductBrandList({super.key});

  @override
  State<ProductBrandList> createState() => _ProductBrandListState();
}

class _ProductBrandListState extends State<ProductBrandList> {
  String currentBrand = 'All';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,

      // bottom: 30.h,

      child: ListView.builder(
        itemCount: kBrands.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.only(left: 30.w),
          child: GestureDetector(
            onTap: () {
              //TODO: Filter by brand
              setState(() {
                currentBrand = kBrands[index];
              });
            },
            child: Text(
              kBrands[index],
              style: AppTyography.headline_600().copyWith(
                fontWeight: FontWeight.w700,
                color: kBrands[index] == currentBrand
                    ? AppColors.neutral500
                    : AppColors.neutral300,
              ),
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
