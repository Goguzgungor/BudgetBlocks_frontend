import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SubWalletCreateController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  TextEditingController passCont = TextEditingController();
  TextEditingController walletnameCont = TextEditingController();
  TextEditingController usernameCont = TextEditingController();
  TextEditingController transacCont = TextEditingController();


}
