import 'package:challenge_fl/products/models/product_model.dart';
import 'package:challenge_fl/products/widgets/widgets.dart';
import 'package:challenge_fl/shared/shared.dart';
import 'package:challenge_fl/shared/typography.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}

class SizePicker extends StatefulWidget {
  const SizePicker({
    this.onSizePick,
    required this.sizes,
    super.key,
  });
  final Function(num size)? onSizePick;
  final List<num> sizes;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  num currentSize = 39;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes
          .map(
            (size) => GestureDetector(
              onTap: () {
                setState(() {
                  currentSize = size;
                });
                widget.onSizePick?.call(size);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                margin: EdgeInsets.only(right: 15.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: currentSize != size ? Border.all() : null,
                  color: currentSize == size
                      ? AppColors.neutral500
                      : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    size.toString(),
                    style: AppTyography.headline_300().copyWith(
                      color: currentSize == size
                          ? AppColors.neutralWhite
                          : AppColors.neutral400,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
