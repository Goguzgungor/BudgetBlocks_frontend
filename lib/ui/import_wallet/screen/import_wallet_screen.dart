import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/home/view/home.dart';
import 'package:solsafe/ui/home/controller/home_controller.dart';
import 'package:solsafe/ui/import_wallet/controller/import_wallet_controller.dart';
import 'package:solsafe/ui/import_wallet/import_wallet_view.dart';

class ImportWalletScreen extends StatelessWidget {
  const ImportWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ImportWalletController(), builder: (_) => const ImportWalletView());
  }
}
