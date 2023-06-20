import 'package:budget_blocks/app/components/core/logged_core_app_barr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/components/confirn_transaction/sol_middle_barr.dart';
import 'package:budget_blocks/app/components/core/bottom_bar.dart';
import 'package:budget_blocks/app/components/core/bottombar_icon.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/core/core_text_field.dart';
import 'package:budget_blocks/app/components/core/dark_button.dart';
import 'package:budget_blocks/app/components/core/dark_button_small.dart';
import 'package:budget_blocks/app/components/core/dark_core_text.dart';
import 'package:budget_blocks/app/components/core/red_button_small.dart';
import 'package:budget_blocks/app/components/home/red_button.dart';
import 'package:budget_blocks/app/components/main_wallet/main_wallet_button.dart';
import 'package:budget_blocks/app/components/transaction/tran_text_block.dart';
import 'package:budget_blocks/app/constants/app_constant.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/network/http_manager.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/check/check.dart';
import 'package:budget_blocks/ui/confirm_transaction/controller/confirm_transaction_controller.dart';
import 'package:budget_blocks/ui/subwallet/subwallet_screen.dart';
import 'package:budget_blocks/ui/success_transaction/success_transaction_screen.dart';
import 'package:budget_blocks/ui/transaction/controller/transaction_controller.dart';

import '../../../app/components/confirn_transaction/receiver_middle_barr.dart';

class ConfirmTransactionView extends StatelessWidget {
  final dynamic balance;
  final String publicKey;
  const ConfirmTransactionView(
      {super.key, required this.balance, required this.publicKey});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<ConfirmTransactionController>();
    return Scaffold(
        appBar: LoggedCoreAppBarr(context),
        backgroundColor: AppColor.background,
        bottomNavigationBar: CustomBottomBar(),
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
                    SolMiddleBarr(balance: balance),
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
                        ReceiverMiddleBarr(
                          publicKey: publicKey,
                        ),
                      ],
                    ),
                    DarkCoreText(text: 'Network fee:           \$0.00012'),
                    SizedBox(
                      height: 150.verticalScale,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: DarkButton(text: 'Cancel')),
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
                                  "reciver_public_key": publicKey,
                                  "balance": balance,
                                  "mainwallet_id": mainwallet_id
                                };

                                Map<String, dynamic> signature =
                                    await HttpManager.instance.transactionPostRequest(
                                        '/user/mainwallet/transaction/send',
                                        requestObj).whenComplete(() => print("Gönderildi"));

                                print(signature['data'].toString());

                                print('DONEEEEEEEE');
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        SuccessTransactionScreen(
                                          balance: balance,
                                          publicKey: publicKey,
                                        )));
                              }

                              if (walletType == 'subwallet') {
                                int user_id = HiveManager.instance
                                    .getMapFromBox(HiveBoxes.USER, users_id);
                                dynamic requestObj = {
                                  "reciver_public_key": publicKey,
                                  "balance": balance,
                                  "user_id": user_id
                                };
                                print(requestObj);
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
