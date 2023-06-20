import 'package:flutter/material.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/theme/app_light_theme.dart';
import 'package:budget_blocks/app/theme/colors.dart';

const font_family = 'RedHatDisplay';
const font_family_montserrat = 'Montserrat';

TextStyle headline1 = TextStyle(
  fontSize: 32.horizontalScale,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontFamily: font_family,
);
TextStyle walletCardTitle = TextStyle(
    fontSize: 14.horizontalScale,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(0.7));
TextStyle walletButtonStyle = TextStyle(
    fontSize: 16.horizontalScale,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: font_family);
TextStyle dropDownStyle = TextStyle(
    fontSize: 18.horizontalScale,
    fontWeight: FontWeight.w500,
    color: AppColor.background,
    fontFamily: font_family);
TextStyle middleBarStyle = TextStyle(
    fontSize: 18.horizontalScale,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: font_family);
TextStyle textFieldStyle = TextStyle(
    fontSize: 18.horizontalScale,
    fontWeight: FontWeight.w400,
    color: AppColor.background,
    fontFamily: font_family);
TextStyle amanountSolStyle = TextStyle(
    fontSize: 24.horizontalScale,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: font_family);
TextStyle amaountStyle = TextStyle(
  letterSpacing: -3,
  fontSize: 40.horizontalScale,
  fontWeight: FontWeight.w800,
  color: Colors.white,
  fontFamily: 'Montserrat',
);
TextStyle areaStyle = TextStyle(
  fontSize: 16.horizontalScale,
  fontWeight: FontWeight.w800,
  color: AppColor.lightGreenColor,
  fontFamily: 'Montserrat',
);
TextStyle AppBarrStyle = TextStyle(
  fontSize: 24.horizontalScale,
  fontWeight: FontWeight.w600,
  color: AppColor.white,
  fontFamily: font_family_montserrat,
  letterSpacing: 5,
);
TextStyle CoreAppBarrStyle = TextStyle(
  fontSize: 22.horizontalScale,
  fontWeight: FontWeight.w400,
  color: AppColor.white,
  fontFamily: font_family,
);
TextStyle landing_icon_style = TextStyle(
    fontSize: 38.horizontalScale,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
    fontFamily: font_family_montserrat,
    letterSpacing: 15.horizontalScale,
    leadingDistribution: TextLeadingDistribution.proportional);
TextStyle middleBarstyle = TextStyle(
    fontSize: 16.horizontalScale,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: font_family);
TextStyle redButtonStyle = TextStyle(
    fontSize: 18.horizontalScale,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontFamily: font_family);
