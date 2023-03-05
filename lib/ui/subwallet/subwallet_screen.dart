import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solsafe/ui/home/view/home.dart';
import 'package:solsafe/ui/home/controller/home_controller.dart';
import 'package:solsafe/ui/landing/view/landing_view.dart';
import 'package:solsafe/ui/subwallet/view/subwallet_view.dart';


import 'controller/subwallet_controller.dart';

class SubWalletScreen extends StatelessWidget {
  const SubWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SubWalletController(),
        builder: (_) => SubWalletView(
            ));
  }
}
