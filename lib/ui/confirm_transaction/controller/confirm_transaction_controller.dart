import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmTransactionController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  TextEditingController amaountCont = TextEditingController();
  TextEditingController reciverText = TextEditingController();
}
