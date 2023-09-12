import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_fl/products/models/models.dart';
import 'package:challenge_fl/products/view/product_detail_page.dart';
import 'package:challenge_fl/shared/shared.dart';
import 'package:challenge_fl/shared/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        ProductDetailPage(product),
      ),
      child: SizedBox(
        height: 224.h,
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductListItemImage(product),
            SizedBox(height: 10.h),
            Text(
              product.name,
              style: AppTyography.bodyText_100(),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.brand500,
                ),
                SizedBox(width: 5.w),
                Text(
                  product.averageRatings.toString(),
                  style: AppTyography.headline_200(),
                ),
                SizedBox(width: 5.w),
                Text(
                  '(${product.reviewCount} Reviews)',
                  style: AppTyography.bodyText_100(),
                ),
              ],
            ),
            Text(
              '\$${product.price}',
              style: AppTyography.headline_300().copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListItemImage extends StatelessWidget {
  const ProductListItemImage(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.5.sp),
      decoration: BoxDecoration(
        // i know this is off the design, but with the image having a background of white, this is is a possible workaround
        color: AppColors.neutral300.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
          //changed the color due to the image background white
          // color: AppColors.neutral300.withOpacity(0.5),
          color: AppColors.neutralWhite,

          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: SvgPicture.asset(
                _buildBrandIcon(product.brandName),
                width: 24.w,
                height: 24.h,
              ),
            ),
            SizedBox(height: 4.h),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 43.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    width: 120.w,
                    height: 85.h,
                    imageUrl: product.images[0],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildBrandIcon(String brandName) {
    final brand = brandName.toLowerCase();
    switch (brand) {
      case 'nike':
        return AppAssets.brandNike;
      case 'adiddas':
        return AppAssets.brandAdiddas;
      case 'jordan':
        return AppAssets.brandJordan;
      case 'puma':
        return AppAssets.brandPuma;
      case 'reebok':
        return AppAssets.brandReebok;
      case 'vans':
        return AppAssets.brandvans;

      default:
        return AppAssets.brandNike;
    }
  }
}
