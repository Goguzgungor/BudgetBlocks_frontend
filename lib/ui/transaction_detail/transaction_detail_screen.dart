import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:solsafe/ui/show_mnemonic/view/show_mnemonic_view.dart';
import 'package:solsafe/ui/transaction/controller/transaction_controller.dart';
import 'package:solsafe/ui/transaction/view/transaction_view.dart';
import 'package:solsafe/ui/transaction_detail/controller/transaction_detail_controller.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TransactionDetailController(),
        builder: (_) => const TransactionView());
  }
}
