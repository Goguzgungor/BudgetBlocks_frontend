import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:solsafe/app/memory/hive_manager.dart';
import 'package:solsafe/ui/login/screen/login_screen.dart';
import 'package:solsafe/ui/main_wallet/main_wallet_screen.dart';
import 'package:solsafe/ui/qr_reader/qr_reader.dart';
import 'package:solsafe/ui/save_expense/save_expense_view.dart';
import 'package:solsafe/ui/success_transaction/success_transaction_screen.dart';

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
