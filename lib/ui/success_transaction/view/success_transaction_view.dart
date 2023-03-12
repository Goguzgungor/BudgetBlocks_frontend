import 'package:budgetBlocks/app/components/core/bottom_bar.dart';
import 'package:budgetBlocks/app/components/core/logged_core_app_barr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/components/core/big_dark_button.dart';
import 'package:budgetBlocks/app/components/core/core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/dark_core_text.dart';
import 'package:budgetBlocks/app/components/home/red_button.dart';
import 'package:budgetBlocks/app/components/success_transaction/success_text.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budgetBlocks/ui/save_expense/view/save_expense_view.dart';
import 'package:budgetBlocks/ui/success_transaction/controller/success_transaction_controller.dart';
import '../../../app/components/confirn_transaction/receiver_middle_barr.dart';

class SuccessTransactionView extends StatelessWidget {
  final dynamic balance;
  final String publicKey;
  const SuccessTransactionView(
      {super.key, required this.publicKey, required this.balance});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<SuccessTransactionController>();
    return Scaffold(
        appBar: LoggedCoreAppBarr(context, text: "MainWallet"),
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
                SuccessText(),
                SizedBox(
                  height: 30.verticalScale,
                ),
                SizedBox(
                  height: 10.verticalScale,
                ),
                SizedBox(
                  height: 30.verticalScale,
                ),
                ReceiverMiddleBarr(publicKey: publicKey),
                DarkCoreText(text: 'View Transaction'),
                SizedBox(
                  height: 120.verticalScale,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SaveExpenseView(
                                    balance: balance,
                                    publicKey: publicKey,
                                  )));
                        },
                        child: RedButton(text: 'Register Expense')),
                    SizedBox(
                      height: 15.horizontalScale,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MainWalletScreen()));
                        },
                        child: BigDarkButton(text: 'Close'))
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
