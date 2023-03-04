
import 'package:flutter/material.dart';


abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  TextTheme get primaryTextTheme => Theme.of(context).primaryTextTheme;
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
  double get topPadding => MediaQuery.of(context).padding.top;
  double get bottomPadding => MediaQuery.of(context).padding.bottom;
  double get extendedAppBarSize => dynamicHeight(50);
  double dynamicHeight(double value) => height / MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) => width / MediaQuery.of(context).size.width * value;

}

abstract class BaseStateless extends StatelessWidget {
  const BaseStateless({Key? key}) : super(key: key);
  ThemeData themeData(BuildContext context) => Theme.of(context);
  ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;
  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
  TextTheme primaryTextTheme(BuildContext context) => Theme.of(context).primaryTextTheme;
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;
  double extendedAppBarSize(BuildContext context) => dynamicHeight(context, 50);
  double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
  double dynamicHeight(BuildContext context, double value) => height(context) /MediaQuery.of(context).size.height* value;
  double dynamicWidth(BuildContext context, double value) => width(context) / MediaQuery.of(context).size.width * value;

}
