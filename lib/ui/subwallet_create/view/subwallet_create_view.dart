import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/components/core/core_app_barr.dart';
import 'package:solsafe/app/components/core/core_text_field.dart';
import 'package:solsafe/app/components/core/headline_text.dart';
import 'package:solsafe/app/components/create_wallet/create_wallet_grid.dart';
import 'package:solsafe/app/components/home/red_button.dart';
import 'package:solsafe/app/components/transaction/tran_text_block.dart';
import 'package:solsafe/app/constants/app_constant.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/memory/hive_manager.dart';
import 'package:solsafe/app/memory/window_local.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/network/http_manager.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/main_wallet/main_wallet_screen.dart';
import 'package:solsafe/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:solsafe/ui/subwallet_create/controller/subwallet_create_controller.dart';

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            CoreTextField(
                controller: controller.transacCont,
                hintText: 'Balance'),
            SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () async {
                  int user_id =
                      int.parse(await controller.getLocal(users_id) ?? '-1');
                  int mainwalletId = int.parse(
                      await controller.getLocal("mainwallet_id") ?? '-1');
                  dynamic requestObject = {
                    "user_name": controller.usernameCont.text,
                    "password": controller.passCont.text,
                    "max_val": int.parse(controller.transacCont.text),
                    "sub_wallet_name": controller.walletnameCont.text,
                    "relation_obj": {
                      "user_id": user_id,
                      "mainwallet_id": mainwalletId
                    }
                  };
                  await HttpManager.instance
                      .postJsonRequest('/user/create/subwallet', requestObject);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MainWalletScreen(),
                    ),
                  );
                },
                child: RedButton(text: 'Create'))
          ]),
        ));
  }
}
