import 'package:budget_blocks/ui/confirm_transaction/confirm_transaction_screen.dart';
import 'package:budget_blocks/ui/login/screen/login_screen.dart';
import 'package:budget_blocks/ui/save_expense/save_expense_screen.dart';
import 'package:budget_blocks/ui/subwallet/subwallet_screen.dart';
import 'package:budget_blocks/ui/subwallet/view/subwallet_view.dart';
import 'package:budget_blocks/ui/success_transaction/success_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';
import 'package:budget_blocks/ui/save_expense/view/save_expense_view.dart';
import 'ui/confirm_transaction/view/confirm_transaction_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveManager.instance.hiveInit();

  await Future.delayed(const Duration(milliseconds: 300));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Budget Blocks',
        home: LoginScreen());
  }
}
