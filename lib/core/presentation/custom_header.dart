import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wad_interview_test/util/colors.dart';

import '../../util/font.dart';
import 'bounce_widget.dart';

class CustomHeader extends StatelessWidget {
  final Widget? leadWidget;
  final bool isColorBlack;
  final String? title;
  final bool centerTitle;
  final Function()? onLeadingPress;
  final Function()? onTrailingOnePress;
  final bool isBlur;

  const CustomHeader({
    super.key,
    this.leadWidget,
    this.isColorBlack = true,
    this.title,
    this.centerTitle = true,
    this.onLeadingPress,
    this.onTrailingOnePress,
    this.isBlur = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.h),
      child: ClipRect(
        child: BackdropFilter(
          filter: isBlur ? ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0) : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            width: double.maxFinite,
            color: isBlur ? kPurpleColor.withOpacity(0.2) : Colors.transparent,
            padding: EdgeInsets.only(left: 16.w, top: 30.h, bottom: 8.h, right: 16.w),
            child: Stack(
              children: [
                /// Title Widget
                Padding(
                  padding: EdgeInsets.only(top: 5.0.h),
                  child: Align(
                    alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
                    child: Text(
                      title ?? '',
                      style: kBarlow600(context).copyWith(
                        fontSize: 21.sp,
                        color: kPrimaryTextColor,
                      ),
                    ),
                  ),
                ),

                /// Leading Widget
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Bounce(
                        onTap: onLeadingPress,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: SizedBox(
                          child: leadWidget,
                        ),
                      ),
                    )),

                /// Trailing Widget
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icons/filter_icon.svg',
                          width: 24.w,
                          height: 24.w,
                          fit: BoxFit.none,
                          colorFilter: const ColorFilter.mode(
                            kBlackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
