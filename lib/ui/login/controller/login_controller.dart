import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/constants/app_constant.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';

import 'package:budgetBlocks/app/models/auth/auth_models.dart';
import 'package:budgetBlocks/app/network/http_manager.dart';

class LoginController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext get context => scaffoldKey.currentContext!;

  TextEditingController username_controller = TextEditingController();
  TextEditingController pas_controller = TextEditingController();
  TextEditingController re_pas_controller = TextEditingController();

  Future createRequest(Map<String, dynamic> userData) async {
    Map<String, dynamic> userExampleData = {
      "user_name": "goktug",
      "e_mail": "yok",
      "password": "demopasword"
    };
    Map<String, dynamic> resp =
        await HttpManager.instance.postJsonRequest(createPath, userExampleData);
    debugPrint(resp['data']);
  }

  Future getRequest(Map<String, dynamic> userData) async {
    Map<String, dynamic> userExampleData = {
      "user_name": "user_name",
      "e_mail": "e_mail",
      "password": "password"
    };
    Map<String, dynamic> resp =
        await HttpManager.instance.getJsonRequest('/connection/create');
    print(resp['data'].toString());
  }

  Future<String?> saveLocal(String boxname, String key, dynamic value) async {
    HiveManager.instance.addMapToBox(boxname, key, value);
  }
}
