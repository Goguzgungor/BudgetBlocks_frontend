import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubWalletEditController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  TextEditingController walletnamecontroller = TextEditingController();
  TextEditingController limitcontroller = TextEditingController();
}
