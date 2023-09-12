
import 'package:challenge_fl/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
