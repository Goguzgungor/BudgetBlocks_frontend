import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/confirm_transaction/controller/confirm_transaction_controller.dart';
import 'package:solsafe/ui/confirm_transaction/view/confirm_transaction_view.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  const ConfirmTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ConfirmTransactionController(),
        builder: (_) => const ConfirmTransactionView());
  }
}
