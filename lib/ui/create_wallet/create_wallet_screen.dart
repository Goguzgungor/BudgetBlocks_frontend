import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budgetBlocks/ui/create_wallet/controller/create_wallet_controller.dart';
import 'package:budgetBlocks/ui/create_wallet/view/create_wallet_view.dart';
import 'package:budgetBlocks/ui/home/view/home.dart';
import 'package:budgetBlocks/ui/home/controller/home_controller.dart';
import 'package:budgetBlocks/ui/landing/view/landing_view.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CreateWalletController(),
        builder: (_) => const CreateWalletView());
  }
}
