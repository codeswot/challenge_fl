
import 'package:challenge_fl/products/models/models.dart';
import 'package:challenge_fl/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection(this.product, {this.isShortReview = false, Key? key})
      : super(key: key);
  final Product product;
  final bool isShortReview;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: isShortReview
          ? (product.reviewCount <= 3 ? 3 : product.reviewCount.toInt())
          : product.reviewCount.toInt(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: const ReviewsSectionItem(),
        );
      },
    );
  }
}



class ReviewsSectionItem extends StatelessWidget {
  const ReviewsSectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nolan Carder',
                  style: AppTyography.headline_300().copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5.h),
                SvgPicture.asset(AppAssets.fakeStartRating),
                SizedBox(
                  height: 44.h,
                  width: 230.w,
                  child: Text(
                    'Perfect for keeping your feet dry and warm in damp conditions. ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: AppTyography.bodyText_100(),
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              'Today',
              style: AppTyography.bodyText_100().copyWith(
                color: AppColors.neutral300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
