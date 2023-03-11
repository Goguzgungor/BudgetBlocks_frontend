import 'package:flutter/material.dart';

import 'package:solsafe/app/components/confirn_transaction/sol_middle_barr.dart';
import 'package:solsafe/app/components/core/core_app_barr.dart';
import 'package:solsafe/app/components/core/dark_button.dart';
import 'package:solsafe/app/components/core/dark_core_text.dart';
import 'package:solsafe/app/components/core/red_button_small.dart';
import 'package:solsafe/app/components/transaction/tran_text_block.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/main_wallet/main_wallet_screen.dart';
import '../../../app/components/confirn_transaction/receiver_middle_barr.dart';

class SaveExpenseView extends StatelessWidget {
  final String publicKey;
  final dynamic balance;
  const SaveExpenseView(
      {super.key, required this.publicKey, required this.balance});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
                    const TranTextBlock(text: 'Register your expense'),
                    Padding(
                      padding: EdgeInsets.only(right: 42.horizontalScale),
                    ),
                    SizedBox(
                      height: 40.verticalScale,
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
                      height: 170.verticalScale,
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
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainWalletScreen()));
                            },
                            child: RedButtonSmall(text: 'Save')),
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
