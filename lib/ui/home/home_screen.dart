import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budget_blocks/ui/home/view/home.dart';
import 'package:budget_blocks/ui/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeViewController(), builder: (_) => const HomeView());
  }
}
