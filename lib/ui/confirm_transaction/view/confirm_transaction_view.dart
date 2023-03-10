import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/components/confirn_transaction/sol_middle_barr.dart';
import 'package:solsafe/app/components/core/bottom_bar.dart';
import 'package:solsafe/app/components/core/bottombar_icon.dart';
import 'package:solsafe/app/components/core/core_app_barr.dart';
import 'package:solsafe/app/components/core/core_text_field.dart';
import 'package:solsafe/app/components/core/dark_button.dart';
import 'package:solsafe/app/components/core/dark_button_small.dart';
import 'package:solsafe/app/components/core/dark_core_text.dart';
import 'package:solsafe/app/components/core/red_button_small.dart';
import 'package:solsafe/app/components/home/red_button.dart';
import 'package:solsafe/app/components/main_wallet/main_wallet_button.dart';
import 'package:solsafe/app/components/transaction/tran_text_block.dart';
import 'package:solsafe/app/constants/app_constant.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/memory/hive_boxes.dart';
import 'package:solsafe/app/memory/hive_manager.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/network/http_manager.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/check/check.dart';
import 'package:solsafe/ui/confirm_transaction/controller/confirm_transaction_controller.dart';
import 'package:solsafe/ui/subwallet/subwallet_screen.dart';
import 'package:solsafe/ui/transaction/controller/transaction_controller.dart';

import '../../../app/components/confirn_transaction/receiver_middle_barr.dart';

class ConfirmTransactionView extends StatelessWidget {
  const ConfirmTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<ConfirmTransactionController>();
    return Scaffold(
        appBar: CoreAppBarr(context, text: "MainWallet"),
        backgroundColor: AppColor.background,
        body: SizedBox(
          width: 390..horizontalScale,
          height: 890.verticalScale,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 50.verticalScale,
            ),
            Column(
              children: [
                Column(
                  children: [
                    const TranTextBlock(text: '''Do you confirm 
sending?'''),
                    Padding(
                      padding: EdgeInsets.only(right: 42.horizontalScale),
                    ),
                    SizedBox(
                      height: 30.verticalScale,
                    ),
                    SizedBox(
                      height: 10.verticalScale,
                    ),
                    SolMiddleBarr(balance: 20),
                    SizedBox(
                      height: 30.verticalScale,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.horizontalScale),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sending To',
                              style: middleBarStyle.copyWith(
                                  fontSize: 14.verticalScale),
                            ),
                          ),
                        ),
                        ReceiverMiddleBarr(balance: 20),
                      ],
                    ),
                    DarkCoreText(text: 'Network fee:           \$0.00012'),
                    SizedBox(
                      height: 170.verticalScale,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DarkButton(text: 'Cancel'),
                        SizedBox(
                          width: 15.horizontalScale,
                        ),
                        InkWell(
                            onTap: () async {
                              String walletType = HiveManager.instance
                                  .getMapFromBox(
                                      HiveBoxes.USER, HiveBoxes.WALLETTYPE);
                              if (walletType == 'mainwallet') {
                                int mainwallet_id = HiveManager.instance
                                    .getMapFromBox(
                                        HiveBoxes.USER, HiveBoxes.MAINWALLET);
                                dynamic requestObj = {
                                  "reciver_public_key":
                                      controller.reciverText.text,
                                  "balance": controller.amaountCont.text,
                                  "mainwallet_id": mainwallet_id
                                };

                                Map<String, dynamic> signature =
                                    await HttpManager.instance.postJsonRequest(
                                        '/user/mainwallet/transaction/send',
                                        requestObj);

                                print(signature['data'].toString());

                                print('DONEEEEEEEE');
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CheckView(
                                        text: signature['data']
                                                ['transaction_id']
                                            .toString())));
                              }

                              if (walletType == 'subwallet') {
                                int user_id = HiveManager.instance
                                    .getMapFromBox(HiveBoxes.USER, users_id);
                                dynamic requestObj = {
                                  "reciver_public_key":
                                      controller.reciverText.text,
                                  "balance": controller.amaountCont.text,
                                  "user_id": user_id
                                };

                                Map<String, dynamic> signature =
                                    await HttpManager.instance.postJsonRequest(
                                        '/user/create/pendingtransaction',
                                        requestObj);

                                print(signature['data'].toString());
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SubWalletScreen()));
                              }
                            },
                            child: RedButtonSmall(text: 'Send')),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
