import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:solsafe/app/memory/hive_manager.dart';
import 'package:solsafe/ui/confirm_transaction/confirm_transaction_screen.dart';
import 'package:solsafe/ui/deneme.dart';
import 'package:solsafe/ui/login/screen/login_screen.dart';
import 'package:solsafe/ui/recieve/receive.screen.dart';
import 'package:solsafe/ui/recieve/view/receive.view.dart';
import 'package:solsafe/ui/subwallet_edit/subwallet_edit_screen.dart';
import 'package:solsafe/ui/subwallet_edit/view/subwallet_edit_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveManager.instance.hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ConfirmTransactionScreen());
  }
}
