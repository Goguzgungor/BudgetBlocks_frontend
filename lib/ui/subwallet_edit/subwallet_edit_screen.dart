import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budgetBlocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:budgetBlocks/ui/show_mnemonic/view/show_mnemonic_view.dart';
import 'package:budgetBlocks/ui/subwallet_edit/view/subwallet_edit_view.dart';
import 'package:budgetBlocks/ui/transaction/controller/transaction_controller.dart';
import 'package:budgetBlocks/ui/transaction/view/transaction_view.dart';
import 'package:budgetBlocks/ui/subwallet_edit/controller/subwallet_edit_controller.dart';

class SubWalletEditScreen extends StatelessWidget {
  const SubWalletEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SubWalletEditController(),
        builder: (_) => const SubWalletEditView());
  }
}
