import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budgetBlocks/ui/home/view/home.dart';
import 'package:budgetBlocks/ui/home/controller/home_controller.dart';
import 'package:budgetBlocks/ui/landing/view/landing_view.dart';
import 'package:budgetBlocks/ui/recieve/controller/receieve.controller.dart';
import 'package:budgetBlocks/ui/recieve/view/receive.view.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ReceiveViewController(), builder: (_) => const ReceiveView());
  }
}
