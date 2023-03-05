import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/memory/window_local.dart';

class LandingViewController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  LocalStorage localStorage = LocalStorage();

  getId(String key) {
    return localStorage.getId('user_id');
  }
}
