import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/memory/hive_boxes.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';

class ReceiveViewController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String pubKey =
      HiveManager.instance.getMapFromBox(HiveBoxes.USER, "public_key");
  Rx<double> _amaount = 0.0.obs;
  double get amaount => _amaount.value;
  set amaount(double value) => _amaount.value = value;

  Rx<TextEditingController> _amaountCont = TextEditingController().obs;
  TextEditingController get amaountCont => _amaountCont.value;
  set amaountCont(TextEditingController value) => _amaountCont.value = value;

  BuildContext get context => scaffoldKey.currentContext!;

  void generateQrQode() {
    amaount = double.parse(amaountCont.text);
  }
}
