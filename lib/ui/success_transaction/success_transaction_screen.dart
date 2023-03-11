import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/confirm_transaction/controller/confirm_transaction_controller.dart';
import 'package:solsafe/ui/confirm_transaction/view/confirm_transaction_view.dart';
import 'package:solsafe/ui/success_transaction/controller/success_transaction_controller.dart';
import 'package:solsafe/ui/success_transaction/view/success_transaction_view.dart';

class SuccessTransactionScreen extends StatelessWidget {
  final String publicKey;
  final dynamic balance;

  const SuccessTransactionScreen(
      {super.key, required this.publicKey, required this.balance});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SuccessTransactionController(),
        builder: (_) => SuccessTransactionView(
              publicKey: publicKey,
              balance: balance,
            ));
  }
}
