import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/components/core/core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/headline_text.dart';
import 'package:budgetBlocks/app/components/create_wallet/create_wallet_grid.dart';
import 'package:budgetBlocks/app/components/home/red_button.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/network/http_manager.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';
import 'package:budgetBlocks/ui/create_sub_wallet/controller/create_sub_wallet_controller.dart';
import 'package:budgetBlocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budgetBlocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';

class CreateSubWalletView extends StatelessWidget {
  const CreateSubWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<CreateSubWalletController>();
    return Scaffold(
        appBar: CoreAppBarr(context, text: "Create New Wallet"),
        backgroundColor: AppColor.background,
        body: SizedBox(
          width: 390..horizontalScale,
          height: 890.verticalScale,
          child:
              Column(mainAxisAlignment: MainAxisAlignment.start, children: []),
        ));
  }
}
