import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../util/colors.dart';

class CustomRoundedButton extends StatelessWidget {
  final String icon;

  const CustomRoundedButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 44.h,
        width: 44.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kYellowColor,
        ),
        child: SvgPicture.asset(
          'assets/icons/$icon',
          width: 8.w,
          height: 8.w,
          fit: BoxFit.scaleDown,
          // colorFilter: const ColorFilter.mode(
          //   kBlackColor,
          //   BlendMode.srcIn,
          // ),
        ),
      ),
    );
  }
}
