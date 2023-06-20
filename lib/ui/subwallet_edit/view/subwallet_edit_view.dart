import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/core/core_text_field.dart';
import 'package:budget_blocks/app/components/core/headline_text.dart';
import 'package:budget_blocks/app/components/create_wallet/create_wallet_grid.dart';
import 'package:budget_blocks/app/components/home/red_button.dart';
import 'package:budget_blocks/app/components/transaction/tran_text_block.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';

import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/network/http_manager.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budget_blocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:budget_blocks/ui/subwallet_edit/controller/subwallet_edit_controller.dart';

class SubWalletEditView extends StatelessWidget {
  final String? sub_user_id;
  const SubWalletEditView({super.key, this.sub_user_id});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<SubWalletEditController>();
    return Scaffold(
        appBar: CoreAppBarr(context, text: "Edit Subwdallet"),
        backgroundColor: AppColor.background,
        body: SizedBox(
          width: 390..horizontalScale,
          height: 890.verticalScale,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TranTextBlock(text: 'Edit The Subwallet'),
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CoreTextField(
                    controller: controller.walletnamecontroller,
                    hintText: 'Walletname'),
                SizedBox(
                  height: 20,
                ),
                CoreTextField(
                    controller: controller.limitcontroller,
                    hintText: 'Transaction Limit'),
              ],
            ),
            SizedBox(
              height: 300,
            ),
            const RedButton(text: 'Save')
          ]),
        ));
  }
}
