import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:solsafe/ui/auth/screen/auth_screen.dart';
import 'package:solsafe/ui/import_wallet/screen/import_wallet_screen.dart';
import 'package:solsafe/ui/login/screen/login_screen.dart';
import 'package:solsafe/ui/main_wallet/main_wallet_screen.dart';
import 'package:solsafe/ui/settings/settings_screen.dart';
import 'package:solsafe/ui/show_mnemonic/show_mnemonic_screen.dart';
import 'package:solsafe/ui/show_mnemonic/view/show_mnemonic_view.dart';
import 'package:solsafe/ui/subwallet/subwallet_screen.dart';
import 'package:solsafe/ui/subwallet_create/subwallet_create_screen.dart';
import 'package:solsafe/ui/transaction/transaction_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginScreen());
  }
}
