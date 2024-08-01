import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_assignment_manula/core/presentation/shimmers/shimmer_builder.dart';
import '../../../util/colors.dart';


class GridShimmer extends StatelessWidget {
  const GridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 17.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.8.h,
        ),
        padding: EdgeInsets.all(10.w),
        itemBuilder: (context, index) {
          return Container(
            width: 176.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    shimmerLoader(child: Container(
                      height: 52.h,
                      color: kWhiteColor,
                    ),),
                    Positioned(
                      top: 8.h,
                      left: 10.w,
                      child: Container(
                        width: 70.w,
                        height: 70.h,
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kButtonShadowColor,
                              offset: const Offset(5, 6),
                              blurRadius: 14.r,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: kWhiteColor,
                          radius: 27.0.r,
                          child: shimmerLoader(
                            child: Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90.h,
                      left: 10.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: shimmerLoader(child: Container(
                              width: 100.w,
                              height: 19.h,
                              color: kWhiteColor,
                            ),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0.h),
                            child: SizedBox(
                              width: 140.w,
                              child: shimmerLoader(child: Container(
                                width: 100.w,
                                height: 30.h,
                                color: kWhiteColor,
                              ),),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0.h),
                            child: SizedBox(
                              width: 120.w,
                              child: shimmerLoader(child: Container(
                                width: 120.w,
                                height: 14.h,
                                color: kWhiteColor,
                              ),),
                            ),
                          ),
                          SizedBox(
                            width: 160.w,
                            child: shimmerLoader(child: Container(
                              width: 160.w,
                              height: 14.h,
                              color: kWhiteColor,
                            ),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0.h),
                            child: SizedBox(
                              width: 80.w,
                              child: shimmerLoader(child: Container(
                                width: 80.w,
                                height: 14.h,
                                color: kWhiteColor,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
