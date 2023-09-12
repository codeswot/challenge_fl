import 'package:challenge_fl/products/models/product_model.dart';
import 'package:challenge_fl/products/widgets/widgets.dart';
import 'package:challenge_fl/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage(this.product, {super.key});
  final Product product;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: AppDefaultAppBar(
          trailing: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.cartIcon),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 15.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailImage(widget.product),
              SizedBox(height: 30.h),
              Text(
                widget.product.name,
                style: AppTyography.headline_600(),
              ),
              SizedBox(height: 30.h),
              Text(
                'Size',
                style: AppTyography.headline_400().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              SizePicker(
                sizes: widget.product.sizes.map((e) => e as num).toList(),
                onSizePick: (size) {
                  debugPrint('size $size');
                },
              ),
              SizedBox(height: 30.h),
              Text(
                'Description',
                style: AppTyography.headline_400().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                widget.product.description,
                style: AppTyography.bodyText_200(),
              ),
              SizedBox(height: 30.h),
              Text(
                'Review (${widget.product.reviewCount})',
                style: AppTyography.headline_400().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              ReviewsSection(
                widget.product,
                isShortReview: true,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 90.h,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 16.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Price', style: AppTyography.bodyText_100()),
                    Text(
                      '\$ ${widget.product.price}',
                      style: AppTyography.headline_600()
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  width: 156.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neutral500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'ADD TO CART',
                      style: AppTyography.headline_300()
                          .copyWith(color: AppColors.neutralWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
