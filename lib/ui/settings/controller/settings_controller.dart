import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  TextEditingController mailCont = TextEditingController();
  TextEditingController walletnameCont = TextEditingController();
  TextEditingController usernameCont = TextEditingController();
  TextEditingController transacCont = TextEditingController();
}
