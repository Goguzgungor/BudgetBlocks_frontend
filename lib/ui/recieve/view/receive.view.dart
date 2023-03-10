import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:solsafe/app/components/core/core_app_barr.dart';
import 'package:solsafe/app/components/core/core_text_field.dart';
import 'package:solsafe/app/components/home/red_button.dart';
import 'package:solsafe/app/components/transaction/tran_text_block.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/recieve/controller/receieve.controller.dart';

class ReceiveView extends StatelessWidget {
  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<ReceiveViewController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: CoreAppBarr(context, text: 'Main Wallet'),
      backgroundColor: AppColor.background,
      body: Obx(() => Center(
            child: SizedBox(
                width: 390..horizontalScale,
                height: 890.verticalScale,
                child: Center(
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
                              decoration: BoxDecoration(color: AppColor.white),
                              child: Center(
                                child: QrImage(
                                  data: controller.amaount.toString() +
                                      " " +
                                      controller.pubKey,
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
                                  hintText: 'Amaount'),
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
                )),
          )),
    );
  }
}
