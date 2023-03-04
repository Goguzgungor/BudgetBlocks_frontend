import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/constants/app_constant.dart';
import 'package:solsafe/app/models/auth/auth_models.dart';
import 'package:solsafe/app/network/http_manager.dart';

class AuthController extends GetxController {
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
}
