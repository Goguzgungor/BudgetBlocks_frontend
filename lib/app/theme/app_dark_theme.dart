import 'package:flutter/material.dart';
import 'package:budgetBlocks/app/constants/padding_and_radius_size.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/theme/app_light_theme.dart';

import '../theme/colors.dart';

import 'init.dart';

class AppDarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;
  @override
  Color backgroundColor = Colors.black;
  @override
  Color scaffoldBackgroundColor = Colors.black;
  @override
  IconThemeData accentIconTheme = const IconThemeData(color: Colors.black);
  @override
  IconThemeData primaryIconTheme = const IconThemeData(color: Colors.black);
  @override
  IconThemeData iconTheme = const IconThemeData(color: Colors.black);
  @override
  Color cardColor = Colors.black;
  @override
  Color bottomAppBarColor = Colors.black;
  @override
  Color dividerColor = AppColor.lightWhite;
  @override
  Color shadowColor = Colors.black26;

  @override
  ColorScheme colorScheme = ColorScheme(
    primary: AppColor.primaryBlue,
    primaryContainer: AppColor.primaryContainer,
    secondary: Colors.white,
    secondaryContainer: Colors.white,
    surface: AppColor.white,
    background: AppColor.background,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: AppColor.darkText,
    onSurface: Colors.white,
    onBackground: AppColor.paleTextColor,
    onError: Colors.white,
    brightness: Brightness.dark,
  );

  @override
  ColorScheme buttonColorScheme = const ColorScheme(
    primary: AppColor.primaryBlue,
    primaryContainer: AppColor.primaryContainer,
    secondary: AppColor.primaryContainer,
    secondaryContainer: AppColor.primaryContainer,
    surface: Colors.white,
    background: AppColor.primaryBlue,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  @override
  CardTheme cardTheme = CardTheme(
    elevation: 0,
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXS)),
    color: Colors.black,
    margin: EdgeInsets.zero,
  );

  @override
  TextTheme textTheme = TextTheme(
    ///HeadLine
    headline1: TextStyle(
      fontSize: 12.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    headline2: TextStyle(
      fontSize: 13.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    headline3: TextStyle(
      fontSize: 18.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    headline4: TextStyle(
      fontSize: 15.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    headline5: TextStyle(
      fontSize: 20.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    headline6: TextStyle(
      fontSize: 26.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),

    ///BodyText
    bodyText1: TextStyle(
      fontSize: 16.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    bodyText2: TextStyle(
      fontSize: 10.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    subtitle1: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w500,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    subtitle2: TextStyle(
      fontSize: 8.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    caption: TextStyle(
      fontSize: 11.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
  );

  @override
  ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryBlue),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 16.horizontalScale,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
        ),
      ),
    ),
  );

  @override
  InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    labelStyle: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w400,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
      color: AppColor.paleTextColor,
      fontSize: 14.horizontalScale,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        radiusS,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        radiusS,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        radiusS,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        radiusS,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        radiusS,
      ),
    ),
  );

  @override
  TextSelectionThemeData textSelectionThemeData = TextSelectionThemeData(
    cursorColor: AppColor.primaryBlue,
    selectionColor: AppColor.primaryBlue.withOpacity(0.2),
    selectionHandleColor: AppColor.primaryBlue,
  );

  @override
  TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(AppColor.primaryBlue),
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: AppColor.primaryBlue,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 16.horizontalScale,
        ),
      ),
    ),
  );

  @override
  OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: AppColor.darkText)),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: AppColor.darkText,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 16.horizontalScale,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXL),
        ),
      ),
    ),
  );

  @override
  CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color?>(AppColor.primaryBlue),
    checkColor: MaterialStateProperty.all<Color?>(Colors.white),
    side: const BorderSide(width: 0.7, color: AppColor.primaryBlue),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusXXS),
    ),
  );

  @override
  RadioThemeData radioThemeData = RadioThemeData(
    fillColor: MaterialStateProperty.all<Color>(AppColor.primaryBlue),
  );

  @override
  DividerThemeData dividerTheme = DividerThemeData(
    color: AppColor.lightWhite,
    space: 0,
  );

  @override
  AppBarTheme appBarTheme = AppBarTheme(
    titleSpacing: 0,
    elevation: 0,
    color: AppColor.primaryBlue,
    titleTextStyle: TextStyle(
      fontSize: 16.horizontalScale,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: fontFamily,
    ),
    centerTitle: true,
    actionsIconTheme: const IconThemeData(color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  @override
  TabBarTheme tabBarTheme = TabBarTheme(
    labelColor: AppColor.primaryBlue,
    labelStyle: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w700,
      color: AppColor.primaryBlue,
      fontFamily: fontFamily,
    ),
    unselectedLabelColor: AppColor.darkText,
    unselectedLabelStyle: TextStyle(
      fontSize: 14.horizontalScale,
      fontWeight: FontWeight.w700,
      color: AppColor.darkText,
      fontFamily: fontFamily,
    ),
  );

  @override
  Color indicatorColor = AppColor.primaryBlue;

  @override
  BottomAppBarTheme bottomAppBarTheme = const BottomAppBarTheme(
    color: Colors.transparent,
    elevation: 0,
  );
}
