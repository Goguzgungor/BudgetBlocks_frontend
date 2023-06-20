import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budget_blocks/ui/auth/auth_view.dart';
import 'package:budget_blocks/ui/auth/controller/auth_controller.dart';
import 'package:budget_blocks/ui/home/view/home.dart';
import 'package:budget_blocks/ui/home/controller/home_controller.dart';
import 'package:budget_blocks/ui/import_wallet/controller/import_wallet_controller.dart';
import 'package:budget_blocks/ui/import_wallet/import_wallet_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: AuthController(), builder: (_) => const AuthView());
  }
}
