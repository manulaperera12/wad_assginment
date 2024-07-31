import '../../../util/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

/// Cash network image loading widget
Widget shimmerLoader({Widget? child, Color? baseColor, Color? highlightColor}) {
  return Shimmer.fromColors(
    baseColor: baseColor ?? kDividerColor,
    highlightColor: highlightColor ?? backgroundColor,
    child: child ??
        Container(
          height: double.infinity,
          width: double.infinity,
          color: kWhiteColor,
        ),
  );
}
