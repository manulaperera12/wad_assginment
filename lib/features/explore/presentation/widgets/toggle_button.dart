import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/colors.dart';
import '../../../../util/font.dart';

class CustomAnimatedToggleButton extends StatefulWidget {
  const CustomAnimatedToggleButton({super.key});

  @override
  CustomAnimatedToggleButtonState createState() => CustomAnimatedToggleButtonState();
}

class CustomAnimatedToggleButtonState extends State<CustomAnimatedToggleButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isLeftActive = true; // to track which side is active

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggle() {
    setState(() {
      isLeftActive = !isLeftActive;
      isLeftActive ? _animationController.reverse() : _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0.h),
      child: Container(
        width: 283.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(29.r)),
          border: Border.all(color: kButtonShadowColor, width: 0.5.w),
          boxShadow: const [
            BoxShadow(
              color: kButtonShadowColor,
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
          color: kToggleButtonColor,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              builder: (_, __) => Positioned(
                left: _animation.value * (283 / 2),
                right: (1 - _animation.value) * (283 / 2),
                child: Container(
                  height: 58.h,
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                    boxShadow: [
                      BoxShadow(
                        color: kButtonShadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isLeftActive) toggle();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/coupon_icon.svg',
                            width: 24.w,
                            height: 24.w,
                            fit: BoxFit.none,
                            colorFilter: ColorFilter.mode(
                              isLeftActive ? kPurpleColor : kSecondaryTextColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Coupons',
                            style: kPoppins500(context).copyWith(
                              fontSize: 16.sp,
                              color: isLeftActive ? kPurpleColor : kSecondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (isLeftActive) toggle();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/bag_icon.svg',
                            width: 24.w,
                            height: 24.w,
                            fit: BoxFit.none,
                            colorFilter: ColorFilter.mode(
                              !isLeftActive ? kPurpleColor : kSecondaryTextColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Vendors',
                            style: kPoppins500(context).copyWith(
                              fontSize: 16.sp,
                              color: !isLeftActive ? kPurpleColor : kSecondaryTextColor,
                            ),
                          ),
                        ],
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
  }
}
