import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/memory/window_local.dart';

class SubWalletCreateController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  LocalStorage localStorage = LocalStorage();
  TextEditingController passCont = TextEditingController();
  TextEditingController walletnameCont = TextEditingController();
  TextEditingController usernameCont = TextEditingController();
  TextEditingController transacCont = TextEditingController();

  Future<String?> getLocal(String key) async {
    return await localStorage.getId(key);
  }

  Future<String?> saveLocal(String key, String value) async {
    await localStorage.save(key, value);
  }
}
