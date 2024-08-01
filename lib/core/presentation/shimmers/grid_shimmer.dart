import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_interview_test/core/presentation/shimmers/shimmer_builder.dart';
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
                    // Positioned(
                    //   top: 90.h,
                    //   left: 10.w,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SizedBox(
                    //         width: 170.w,
                    //         child: shimmerLoader(child: Container(
                    //           width: 170.w.w,
                    //           // height: 16.h,
                    //           color: kWhiteColor,
                    //         ),),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.symmetric(vertical: 10.0.h),
                    //         child: shimmerLoader(child: Container(
                    //           width: 150.w,
                    //           color: kWhiteColor,
                    //         ),),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(bottom: 8.0.h,),
                    //         child: SizedBox(
                    //           width: 156.w,
                    //           child: shimmerLoader(child: Container(
                    //             width: 156.w,
                    //             color: kWhiteColor,
                    //           ),),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 63.h,
                    //   right: 10.w,
                    //   child: shimmerLoader(child: Container(
                    //     width: 60.w,
                    //     height: 60.h,
                    //     color: kWhiteColor,
                    //   ),),
                    // ),
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
