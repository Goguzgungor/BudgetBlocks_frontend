import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budget_blocks/ui/confirm_transaction/controller/confirm_transaction_controller.dart';
import 'package:budget_blocks/ui/confirm_transaction/view/confirm_transaction_view.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  final dynamic balance;
  final String publicKey;
  const ConfirmTransactionScreen(
      {super.key, required this.balance, required this.publicKey});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ConfirmTransactionController(),
        builder: (_) => ConfirmTransactionView(
              balance: balance,
              publicKey: publicKey,
            ));
  }
}
