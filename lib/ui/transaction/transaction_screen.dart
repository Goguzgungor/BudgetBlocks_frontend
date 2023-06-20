import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budget_blocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:budget_blocks/ui/show_mnemonic/view/show_mnemonic_view.dart';
import 'package:budget_blocks/ui/transaction/controller/transaction_controller.dart';
import 'package:budget_blocks/ui/transaction/view/transaction_view.dart';

class TransactionScreen extends StatelessWidget {
  final dynamic balance;
  const TransactionScreen({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TransactionController(),
        builder: (_) => TransactionView(
              balance: balance,
            ));
  }
}
