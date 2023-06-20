import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/core/core_text_field.dart';
import 'package:budget_blocks/app/components/core/headline_text.dart';
import 'package:budget_blocks/app/components/create_wallet/create_wallet_grid.dart';
import 'package:budget_blocks/app/components/home/red_button.dart';
import 'package:budget_blocks/app/components/transaction/tran_text_block.dart';
import 'package:budget_blocks/app/constants/app_constant.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/network/http_manager.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budget_blocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:budget_blocks/ui/subwallet_create/controller/subwallet_create_controller.dart';

part 'ads.dart';

class SubWalletCreateView extends StatelessWidget {
  const SubWalletCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<SubWalletCreateController>();
    return Scaffold(
        appBar: CoreAppBarr(context, text: "Create SubWallet"),
        backgroundColor: AppColor.background,
        body: SizedBox(
          width: 390..horizontalScale,
          height: 890.verticalScale,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TranTextBlock(
                text: 'Create New Sub Wallet',
              ),
              SizedBox(
                height: 50.verticalScale,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.verticalScale),
                child: CoreTextField(
                    controller: controller.walletnameCont,
                    hintText: 'Wallet Name'),
              ),
              CoreTextField(
                  controller: controller.usernameCont,
                  hintText: 'SubWallet Username'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.verticalScale),
                child: CoreTextField(
                    controller: controller.passCont,
                    hintText: 'SubWallet Password'),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                  onTap: () async {
                    int user_id = HiveManager.instance
                        .getMapFromBox(HiveBoxes.USER, users_id);
                    int mainwalletId = HiveManager.instance
                        .getMapFromBox(HiveBoxes.USER, HiveBoxes.MAINWALLET);
                    dynamic requestObject = {
                      "user_name": controller.usernameCont.text,
                      "password": controller.passCont.text,
                      "balance": 100,
                      "sub_wallet_name": controller.walletnameCont.text,
                      "relation_obj": {
                        "user_id": user_id,
                        "mainwallet_id": mainwalletId
                      }
                    };
                    await HttpManager.instance.postJsonRequest(
                        '/user/create/subwallet', requestObject);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainWalletScreen(),
                      ),
                    );
                  },
                  child: RedButton(text: 'Create'))
            ]),
          ),
        ));
  }
}
