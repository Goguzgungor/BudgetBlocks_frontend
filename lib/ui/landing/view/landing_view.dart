import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/components/home/red_button.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/memory/hive_boxes.dart';
import 'package:solsafe/app/memory/hive_manager.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/create_sub_wallet/create_sub_wallet_screen.dart';
import 'package:solsafe/ui/create_wallet/create_wallet_screen.dart';
import 'package:solsafe/ui/import_wallet/screen/import_wallet_screen.dart';
import 'package:solsafe/ui/landing/controller/lading_controller.dart';
import 'package:solsafe/ui/show_mnemonic/show_mnemonic_screen.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<LandingViewController>();
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: SizedBox(
            width: 390..horizontalScale,
            height: 890.verticalScale,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/landing/budget_blocks.svg',
                        width: 96.horizontalScale,
                        height: 107.verticalScale,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '''BUDGET
BLOCKS''',
                              style: landing_icon_style,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'CRYPTO MADE EASY',
                              style: landing_icon_style.copyWith(
                                  fontSize: 14, letterSpacing: 6),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                          onTap: ()  {
                            int user_id =  HiveManager.instance.getMapFromBox(HiveBoxes.USER, 'user_id');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CreateWalletScreen(),
                              ),
                            );
                          },
                          child: RedButton(text: 'Create New Wallet')),
                      SizedBox(
                        height: 20.verticalScale,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ImportWalletScreen(),
                              ),
                            );
                          },
                          child: RedButton(text: 'Import Existing Wallet'))
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
