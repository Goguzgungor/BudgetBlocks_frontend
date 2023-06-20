import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budget_blocks/ui/main_wallet/view/main_wallet_view.dart';

import 'controller/main_wallet_controller.dart';

class MainWalletScreen extends StatelessWidget {
  const MainWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainWalletController(), builder: (_) => const MainWalletView());
  }
}
