
import 'package:challenge_fl/shared/shared.dart';
import 'package:challenge_fl/shared/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppDefaultAppBar extends StatelessWidget {
  const AppDefaultAppBar({
    this.title,
    this.trailing,
    super.key,
  });
  final String? title;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 19.w,
          right: 19.w,
          top: 30.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: AppColors.neutral500,
              onPressed: () => context.pop(),
              icon: SvgPicture.asset(AppAssets.backIcon),
            ),
            Text(
              title ?? '',
              style: AppTyography.headline_400().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
