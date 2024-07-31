import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../divider.dart';
import 'shimmer_builder.dart';
import 'package:flutter/material.dart';

class BasicListViewShimmer extends StatelessWidget {
  const BasicListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 75.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.9),
                Container(
                  height: 20.h,
                  width: Random().nextInt(30) + 230,
                  margin: EdgeInsets.only(left: 31),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: shimmerLoader(),
                ),
                Spacer(),
                CustomDivider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
