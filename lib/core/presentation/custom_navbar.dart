import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../util/colors.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 1; // selected index

  final List<String> icons = [
    "home_icon.svg",
    "explore_icon.svg",
    "nav_heat_icon.svg",
    "info.svg",
  ];
  final List<String> iconsFilled = [
    "home_fill.svg",
    "explore_fill.svg",
    "fav_fill.svg",
    "infor_fill.svg",
  ];

  final List<String> labels = [
    'Home',
    'Explore',
    'Favourites',
    'Information',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 80.h,
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(
          color: kButtonShadowColor,
          width: 0.25.w,
        ),
        boxShadow: [
          BoxShadow(
            color: kBottomNavShadowColor,
            offset: const Offset(0, 0),
            blurRadius: 5.r,
            spreadRadius: 3.r,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: EdgeInsets.only(bottom: _selectedIndex == index ? 5.h : 15.h),
                  child: Transform.translate(
                    offset: Offset(0, _selectedIndex == index ? -2.h : 10), // move up when selected
                    child: SvgPicture.asset(
                      "assets/icons/${_selectedIndex == index ? iconsFilled[index] : icons[index]}",
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.none,
                      // colorFilter: ColorFilter.mode(
                      //   _selectedIndex == index ? kPurpleColor : kSecondaryTextColor,
                      //   BlendMode.srcIn,
                      // ),
                    ),
                  ),
                ),
                if (_selectedIndex == index)
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 12.sp,
                    ),
                  )
              ],
            ),
          );
        }),
      ),
    );
  }
}
