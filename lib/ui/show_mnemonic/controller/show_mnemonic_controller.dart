import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/memory/window_local.dart';

class ShowMnemonicController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  LocalStorage localStorage = LocalStorage();

  Future<String>? getname() async {
    return await localStorage.getId('username') ?? '';
  }

  savename() async {
    localStorage.save('username', 'midex');
  }
}
