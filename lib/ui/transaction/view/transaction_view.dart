import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/transaction/controller/transaction_controller.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<TransactionController>();
    return Scaffold(
        appBar: CoreAppBarr(context, text: "Create New Wallet"),
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
                            const TranTextBlock(),
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
                        controller: controller.amaountCont, hintText: 'Amonut'),
                    SizedBox(
                      height: 10.verticalScale,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DarkCoreText(text: 'Available: 10.05 SOL'),
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
                        RedButtonSmall(text: 'Next'),
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
