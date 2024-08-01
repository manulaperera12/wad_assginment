import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wad_interview_test/core/presentation/shimmers/shimmer_builder.dart';
import 'package:wad_interview_test/util/colors.dart';

class ErrorWidgetImage extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? color;
  final Color? circularProgressIndicatorColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final bool loading;
  final double? value;

  const ErrorWidgetImage(
      {super.key,
      this.padding,
      this.width,
      this.height,
      this.color,
      this.circularProgressIndicatorColor,
      this.border,
      this.borderRadius,
      this.loading = false,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? backgroundColor,
        // border: border ?? Border.all(width: 1, color: kSearchIconColor),
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(0.r)),
      ),
      child: loading && value == null
          ? ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(0.r)),
              child: shimmerLoader(
                  baseColor: kDividerColor.withOpacity(0.3), highlightColor: kSecondaryTextColor.withOpacity(0.6)),
            )
          : Center(
              child: SizedBox(
                width: width ?? 35,
                height: height ?? 35,
                child: loading
                    ? CircularProgressIndicator(color: circularProgressIndicatorColor ?? kPurpleColor, value: value)
                    : Image.asset('assets/images/error_img.png', fit: BoxFit.contain),
              ),
            ),
    );
  }
}
