import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Text("Discover"),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
    );
  }
}
