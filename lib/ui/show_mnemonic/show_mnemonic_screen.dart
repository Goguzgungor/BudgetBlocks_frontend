import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budgetBlocks/ui/create_wallet/create_wallet_screen.dart';
import 'package:budgetBlocks/ui/home/view/home.dart';
import 'package:budgetBlocks/ui/home/controller/home_controller.dart';
import 'package:budgetBlocks/ui/landing/view/landing_view.dart';
import 'package:budgetBlocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:budgetBlocks/ui/show_mnemonic/view/show_mnemonic_view.dart';

class ShowMnemonicScreen extends StatelessWidget {
  final int user_id;
  const ShowMnemonicScreen({super.key, required this.user_id});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ShowMnemonicController(),
        builder: (_) => ShowMnemonicView(
              user_id: user_id,
            ));
  }
}
