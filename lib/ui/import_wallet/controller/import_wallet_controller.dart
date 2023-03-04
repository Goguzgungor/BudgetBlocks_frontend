import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImportWalletController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  TextEditingController controller = TextEditingController();
}
