import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';

class CreateWalletController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  int getLocal(String box, String key) {
    return HiveManager.instance.getMapFromBox(box, key);
  }
}
