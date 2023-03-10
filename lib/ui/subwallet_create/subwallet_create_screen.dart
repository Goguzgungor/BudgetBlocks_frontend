import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:solsafe/ui/show_mnemonic/view/show_mnemonic_view.dart';
import 'package:solsafe/ui/subwallet_create/controller/subwallet_create_controller.dart';
import 'package:solsafe/ui/subwallet_create/view/subwallet_create_view.dart';
import 'package:solsafe/ui/transaction/controller/transaction_controller.dart';
import 'package:solsafe/ui/transaction/view/transaction_view.dart';
import 'package:solsafe/ui/subwallet_edit/controller/subwallet_edit_controller.dart';

class SubWalletCreateScreen extends StatelessWidget {
  const SubWalletCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SubWalletCreateController(),
        builder: (_) => const SubWalletCreateView());
  }
}
