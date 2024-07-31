import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/colors.dart';
import '../../../../util/font.dart';
import '../../features/vendor_profile/presentation/vendor_profile_screen.dart';

class CouponsGrid extends StatefulWidget {
  final Function onTap;
  final bool showCoupons;

  const CouponsGrid({super.key, required this.onTap, required this.showCoupons});

  @override
  State<CouponsGrid> createState() => _CouponsGridState();
}

class _CouponsGridState extends State<CouponsGrid> {
  bool isClickedActive = false;
  bool isGoldPackageOnly = false;
  bool isClockVisible = false;
  final List<dynamic> couponObjBluePrint = List.generate(10, (index) => {});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: couponObjBluePrint.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 17.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.8.h,
        ),
        padding: EdgeInsets.all(10.w),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => widget.onTap(),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: Container(
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
                      Container(
                        height: 52.h,
                        width: double.infinity,
                        color: kWhiteColor,
                        child: Image.asset('assets/images/cover.png', fit: BoxFit.cover),
                      ),
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
                          child: InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: kWhiteColor,
                              radius: 27.0.r,
                              child: ClipOval(
                                child: Image.asset('assets/images/profile_star.png', fit: BoxFit.cover),
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
                            Text(
                              widget.showCoupons ? 'Coupons' : 'Company Name',
                              style: kBarlow500(context),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0.h),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      style: kBarlow700(context, color: kPrimaryTextColor),
                                      text: "Save ",
                                    ),
                                    TextSpan(
                                      style: kBarlow700(
                                        context,
                                        color: kPurpleColor,
                                        fontSize: 28.sp,
                                      ),
                                      text: "1,500",
                                    ),
                                    TextSpan(
                                        style: kBarlow300(
                                          context,
                                          color: kPurpleColor,
                                          fontSize: 12.sp,
                                        ),
                                        text: "LKR")
                                  ])),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0.h),
                              child: SizedBox(
                                width: 156.w,
                                child: Text(
                                  "Enjoy 50% off this season on all Burgers",
                                  style: kPoppins400(
                                    context,
                                    color: kSecondaryTextColor,
                                    fontSize: 14.sp,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 63.h,
                        right: 10.w,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isClickedActive = !isClickedActive;
                            });
                            debugPrint('Heart Clicked');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/heart_white_icon.svg',
                            width: 19,
                            height: 19,
                            fit: BoxFit.contain,
                            colorFilter: ColorFilter.mode(
                              isClickedActive ? kRedColor : kHeartNotActive,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isClockVisible,
                        child: Positioned(
                          top: 5.h,
                          right: 10.w,
                          child: SvgPicture.asset(
                            'assets/icons/clock_icon.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isGoldPackageOnly,
                        child: Positioned(
                          top: 180.h,
                          left: 0,
                          child: Container(
                            height: 85.h,
                            width: 176.w,
                            color: kCouponGoldPackageBg,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 14.0.h),
                                    child: SvgPicture.asset(
                                      'assets/icons/lock_icon.svg',
                                      width: 30.w,
                                      height: 30.w,
                                      fit: BoxFit.cover,
                                      colorFilter: const ColorFilter.mode(
                                        kWhiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 13.0.h),
                                    child: Text(
                                      'Gold Package Only',
                                      style: kPoppins400(
                                        context,
                                        color: kWhiteColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
