import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/create_wallet/create_wallet_screen.dart';
import 'package:solsafe/ui/home/view/home.dart';
import 'package:solsafe/ui/home/controller/home_controller.dart';
import 'package:solsafe/ui/landing/view/landing_view.dart';
import 'package:solsafe/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:solsafe/ui/show_mnemonic/view/show_mnemonic_view.dart';

class ShowMnemonicScreen extends StatelessWidget {
  const ShowMnemonicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ShowMnemonicController(),
        builder: (_) => const ShowMnemonicView());
  }
}
