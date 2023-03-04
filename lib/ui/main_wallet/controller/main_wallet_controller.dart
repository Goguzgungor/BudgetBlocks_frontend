import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWalletController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;
  
}
