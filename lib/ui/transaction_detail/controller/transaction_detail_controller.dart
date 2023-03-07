import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TransactionDetailController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

}
