
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

/// Barlow
TextStyle kBarlow300(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize, double? height}) =>
    TextStyle(
      fontFamily: 'Barlow',
      color: color,
      fontSize: fontSize ?? 18.sp,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      height: height,
    );
TextStyle kBarlow400(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize, double? height}) =>
    TextStyle(
      fontFamily: 'Barlow',
      color: color,
      fontSize: fontSize ?? 18.sp,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: height,
    );

TextStyle kBarlow500(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize}) =>
    TextStyle(
      fontFamily: 'Barlow',
      color: color,
      fontSize: fontSize ?? 18.sp,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );

TextStyle kBarlow600(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize}) =>
    TextStyle(
      fontFamily: 'Barlow',
      color: color,
      fontSize: fontSize ?? 18.sp,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    );

TextStyle kBarlow700(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize}) =>
    TextStyle(
      fontFamily: 'Barlow',
      color: color,
      fontSize: fontSize ?? 18.sp,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    );

/// Poppins
TextStyle kPoppins400(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize}) =>
    TextStyle(
      fontFamily: 'Poppins',
      color: color,
      fontSize: fontSize ?? 18.sp,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );

TextStyle kPoppins500(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize}) =>
    TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 16.sp,
    );

TextStyle kPoppins600(BuildContext context, {Color color = kPrimaryTextColor, double? fontSize}) =>
    TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins",
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 22.sp,
    );

