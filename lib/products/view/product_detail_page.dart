import 'package:cached_network_image/cached_network_image.dart';
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
            children: [
              ProductDetailImage(widget.product),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailImage extends StatefulWidget {
  const ProductDetailImage(this.product, {super.key});
  final Product product;

  @override
  State<ProductDetailImage> createState() => _ProductDetailImageState();
}

class _ProductDetailImageState extends State<ProductDetailImage> {
  int index = 0;
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
        width: double.infinity,
        height: 312.h,
        decoration: BoxDecoration(
          //changed the color due to the image background white
          // color: AppColors.neutral300.withOpacity(0.5),
          color: AppColors.neutralWhite,

          borderRadius: BorderRadius.circular(20),
        ),
        child: PageView.builder(
          itemCount: widget.product.images.length,
          itemBuilder: ((context, index) {
            final image = widget.product.images[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 31.w),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: widget.product.images
                            .map(
                              (e) => ProductDetailImagePageIndicator(
                                e == widget.product.images[index],
                              ),
                            )
                            .toList(),
                      ),
                      const ProductColorPicker(),
                    ],
                  )
                ],
              ),
            );
          }),
          onPageChanged: (v) {
            setState(() {
              index = v;
            });
          },
        ),
      ),
    );
  }
}

class ProductDetailImagePageIndicator extends StatelessWidget {
  const ProductDetailImagePageIndicator(this.isSelected, {super.key});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 7.w,
      height: 7.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.neutral500 : AppColors.neutral300,
      ),
    );
  }
}

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
