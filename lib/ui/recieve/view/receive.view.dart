import 'package:budget_blocks/app/components/core/logged_core_app_barr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/core/core_text_field.dart';
import 'package:budget_blocks/app/components/home/red_button.dart';
import 'package:budget_blocks/app/components/transaction/tran_text_block.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/recieve/controller/receieve.controller.dart';

class ReceiveView extends StatelessWidget {
  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<ReceiveViewController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: LoggedCoreAppBarr(context),
      backgroundColor: AppColor.background,
      body: Obx(() => Center(
            child: SizedBox(
                width: 390..horizontalScale,
                height: 890.verticalScale,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TranTextBlock(
                          text: 'Receive assests to wallet',
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 20.verticalScale),
                          child: SizedBox(
                            height: 250.verticalScale,
                            width: 250.horizontalScale,
                            child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: AppColor.white),
                                child: Center(
                                  child: QrImage(
                                    data: controller.pubKey +
                                        " " +
                                        controller.amaount.toString(),
                                    version: QrVersions.auto,
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 140.horizontalScale,
                                child: CoreTextField(
                                    controller: controller.amaountCont,
                                    hintText: 'Amount'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 10.horizontalScale,
                                    left: 25.horizontalScale),
                                child: SvgPicture.asset(
                                    'assets/wallet_page/sol_logo.svg'),
                              ),
                              Text(
                                'SOL',
                                style: amanountSolStyle.copyWith(
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.verticalScale,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 25.verticalScale),
                          child: InkWell(
                              onTap: () {
                                controller.generateQrQode();
                              },
                              child: RedButton(text: 'Generate New QR')),
                        ),
                      ],
                    ),
                  ),
                )),
          )),
    );
  }
}
