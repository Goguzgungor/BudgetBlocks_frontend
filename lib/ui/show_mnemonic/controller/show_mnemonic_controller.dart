import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMnemonicController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<bool> _isOkey = false.obs;
  bool get isOkey => _isOkey.value;
  set isOkey(bool value) => _isOkey.value = value;
  BuildContext get context => scaffoldKey.currentContext!;

  void changePermission() {
    if (isOkey == true) {
      isOkey = false;
    } else if (isOkey == false) {
      isOkey = true;
    }
  }
}
