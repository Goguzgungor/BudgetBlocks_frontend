import 'package:budgetBlocks/ui/save_expense/controller/save_expense_controller.dart';
import 'package:budgetBlocks/ui/save_expense/view/save_expense_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budgetBlocks/ui/settings/controller/settings_controller.dart';
import 'package:budgetBlocks/ui/settings/view/settings_view.dart';

class SaveExpenseScreen extends StatelessWidget {
  final dynamic balance;
  final String  publicKey;

  const SaveExpenseScreen({super.key, this.balance, required this.publicKey});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SaveExpenseController(),
        builder: (_) => SaveExpenseView(
              balance: balance,
              publicKey: publicKey,
            ));
  }
}
