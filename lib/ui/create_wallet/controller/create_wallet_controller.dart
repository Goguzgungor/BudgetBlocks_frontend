import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/memory/window_local.dart';

class CreateWalletController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  LocalStorage localStorage = LocalStorage();

  Future<String?> getName(String key) async {
    return await localStorage.getId(key);
  }

  
}
