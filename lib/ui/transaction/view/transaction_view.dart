import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/components/core/bottom_bar.dart';
import 'package:budgetBlocks/app/components/core/bottombar_icon.dart';
import 'package:budgetBlocks/app/components/core/core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/core_text_field.dart';
import 'package:budgetBlocks/app/components/core/dark_button.dart';
import 'package:budgetBlocks/app/components/core/dark_button_small.dart';
import 'package:budgetBlocks/app/components/core/dark_core_text.dart';
import 'package:budgetBlocks/app/components/core/red_button_small.dart';
import 'package:budgetBlocks/app/components/home/red_button.dart';
import 'package:budgetBlocks/app/components/main_wallet/main_wallet_button.dart';
import 'package:budgetBlocks/app/components/transaction/tran_text_block.dart';
import 'package:budgetBlocks/app/constants/app_constant.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/memory/hive_boxes.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/network/http_manager.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';
import 'package:budgetBlocks/ui/check/check.dart';
import 'package:budgetBlocks/ui/confirm_transaction/confirm_transaction_screen.dart';
import 'package:budgetBlocks/ui/subwallet/subwallet_screen.dart';
import 'package:budgetBlocks/ui/transaction/controller/transaction_controller.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<TransactionController>();
    return Scaffold(
        appBar: CoreAppBarr(context, text: "Transaction"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const TranTextBlock(text: 'You are sending'),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 42.horizontalScale),
                              child: Text(
                                'SOL',
                                style: amanountSolStyle.copyWith(
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 65.horizontalScale),
                          child: SvgPicture.asset(
                              'assets/wallet_page/sol_logo.svg'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.verticalScale,
                    ),
                    CoreTextField(
                        controller: controller.reciverText,
                        hintText: 'Recipient address'),
                    SizedBox(
                      height: 10.verticalScale,
                    ),
                    CoreTextField(
                        controller: controller.amaountCont, hintText: 'Amount'),
                    SizedBox(
                      height: 10.verticalScale,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DarkCoreText(text: 'Available: 10.0xw5 SOL'),
                        SizedBox(
                          width: 50.horizontalScale,
                        ),
                        DarkButtonSmall(
                          text: 'Max',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 200.verticalScale,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ConfirmTransactionScreen(
                                        balance: controller.amaountCont.text,
                                        publicKey: controller.reciverText.text,
                                      )));
                            },
                            child: RedButtonSmall(text: 'Next')),
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
