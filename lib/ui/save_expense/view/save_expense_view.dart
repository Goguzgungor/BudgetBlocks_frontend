import 'package:budgetBlocks/app/components/core/bottom_bar.dart';
import 'package:budgetBlocks/app/components/core/logged_core_app_barr.dart';
import 'package:budgetBlocks/app/components/save_expense/dropdown.dart';
import 'package:budgetBlocks/ui/save_expense/controller/save_expense_controller.dart';
import 'package:flutter/material.dart';

import 'package:budgetBlocks/app/components/confirn_transaction/sol_middle_barr.dart';
import 'package:budgetBlocks/app/components/core/core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/dark_button.dart';
import 'package:budgetBlocks/app/components/core/dark_core_text.dart';
import 'package:budgetBlocks/app/components/core/red_button_small.dart';
import 'package:budgetBlocks/app/components/transaction/tran_text_block.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';
import 'package:budgetBlocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:get/get.dart';
import '../../../../app/components/confirn_transaction/receiver_middle_barr.dart';

class SaveExpenseView extends StatelessWidget {
  final String publicKey;
  final dynamic balance;
  const SaveExpenseView(
      {super.key, required this.publicKey, required this.balance});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<SaveExpenseController>();

    return Scaffold(
        appBar: LoggedCoreAppBarr(context),
        backgroundColor: AppColor.background,
        bottomNavigationBar: CustomBottomBar(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                      height: 50.verticalScale,
                    ),
                    ReceiverMiddleBarr(
                      publicKey: publicKey,
                    ),
                    SizedBox(
                      height: 50.verticalScale,
                    ),
                    SizedBox(
                      width: 270,
                      height: 35,
                      child: Center(
                        child: DecoratedBox(
                            decoration: BoxDecoration(color: AppColor.white),
                            child: CustomDropdownButton()),
                      ),
                    ),
                    SizedBox(
                      height: 130.verticalScale,
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
