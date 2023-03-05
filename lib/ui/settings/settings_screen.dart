
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/settings/controller/settings_controller.dart';
import 'package:solsafe/ui/settings/view/settings_view.dart';
import 'package:solsafe/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:solsafe/ui/show_mnemonic/view/show_mnemonic_view.dart';
import 'package:solsafe/ui/subwallet_create/controller/subwallet_create_controller.dart';
import 'package:solsafe/ui/subwallet_create/view/subwallet_create_view.dart';
import 'package:solsafe/ui/transaction/controller/transaction_controller.dart';
import 'package:solsafe/ui/transaction/view/transaction_view.dart';
import 'package:solsafe/ui/transaction_detail/controller/transaction_detail_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SettingsController(),
        builder: (_) => const SettingsView());
  }
}
