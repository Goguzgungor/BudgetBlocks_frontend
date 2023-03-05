import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/memory/window_local.dart';

class SettingsController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  LocalStorage localStorage = LocalStorage();
  TextEditingController mailCont = TextEditingController();
  TextEditingController walletnameCont = TextEditingController();
  TextEditingController usernameCont = TextEditingController();
  TextEditingController transacCont = TextEditingController();
}
