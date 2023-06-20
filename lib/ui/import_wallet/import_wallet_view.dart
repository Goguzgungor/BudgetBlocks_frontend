import 'package:budget_blocks/app/components/core/core_scafflod_messenger.dart';
import 'package:budget_blocks/app/components/transaction/tran_text_block.dart';
import 'package:budget_blocks/app/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/core/headline_text.dart';
import 'package:budget_blocks/app/components/home/red_button.dart';
import 'package:budget_blocks/app/components/import_wallet/import_wallet_app_barr.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/home/controller/home_controller.dart';
import 'package:budget_blocks/ui/import_wallet/controller/import_wallet_controller.dart';

class ImportWalletView extends StatelessWidget {
  const ImportWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<ImportWalletController>();
    return Scaffold(
      appBar: ImportWalletAppBarr(context, text: 'Import Existing Wallet'),
      backgroundColor: AppColor.background,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TranTextBlock(text: "Go Back"),
                SizedBox(
                    height: 420.verticalScale,
                    width: 303.horizontalScale,
                    child: GridView.count(
                        childAspectRatio: 140 / 34,
                        crossAxisSpacing: 22,
                        mainAxisSpacing: 18,
                        crossAxisCount: 2,
                        children: List.generate(12, (index) {
                          return SizedBox(
                              width: 50.horizontalScale,
                              height: 34.verticalScale,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffD9D9D9)),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text((index + 1).toString()),
                                          )),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextField(
                                          controller: controller.controller1,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 25, bottom: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }))),
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          showCoreSnackBarr(context, comingSoon);
                        },
                        child: RedButton(text: 'Next')),
                    SizedBox(
                      height: 21.verticalScale,
                    ),
                    Text(
                      'What is that?',
                      style: textFieldStyle.copyWith(color: Color(0xffA6A6A6)),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
