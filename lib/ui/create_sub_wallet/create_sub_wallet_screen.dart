import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/create_sub_wallet/controller/create_sub_wallet_controller.dart';
import 'package:solsafe/ui/create_sub_wallet/view/create_sub_wallet_view.dart';
import 'package:solsafe/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:solsafe/ui/show_mnemonic/view/show_mnemonic_view.dart';
import 'package:solsafe/ui/transaction/controller/transaction_controller.dart';
import 'package:solsafe/ui/transaction/view/transaction_view.dart';

class CreateSubWalletScreen extends StatelessWidget {
  const CreateSubWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CreateSubWalletController(),
        builder: (_) => const CreateSubWalletView());
  }
}
