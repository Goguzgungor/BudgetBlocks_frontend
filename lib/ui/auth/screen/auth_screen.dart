import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/auth/auth_view.dart';
import 'package:solsafe/ui/auth/controller/auth_controller.dart';
import 'package:solsafe/ui/home/view/home.dart';
import 'package:solsafe/ui/home/controller/home_controller.dart';
import 'package:solsafe/ui/import_wallet/controller/import_wallet_controller.dart';
import 'package:solsafe/ui/import_wallet/import_wallet_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AuthController(), builder: (_) => const AuthView());
  }
}
