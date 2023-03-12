import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:budgetBlocks/ui/settings/controller/settings_controller.dart';
import 'package:budgetBlocks/ui/settings/view/settings_view.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SettingsController(), builder: (_) => const SettingsView());
  }
}
