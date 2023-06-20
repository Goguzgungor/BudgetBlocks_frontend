import 'package:budget_blocks/app/components/core/core_scafflod_messenger.dart';
import 'package:budget_blocks/app/constants/app_constant.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';
import 'package:budget_blocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budget_blocks/ui/subwallet/subwallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:budget_blocks/app/components/core/bottombar_icon.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/ui/landing/landing_screen.dart';
import 'package:budget_blocks/ui/settings/settings_screen.dart';
import 'package:flutter_svg/svg.dart';

class SettingsBottomBar extends StatelessWidget {
  SettingsBottomBar({super.key});
  String walletType =
      HiveManager.instance.getMapFromBox(HiveBoxes.USER, HiveBoxes.WALLETTYPE);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90.verticalScale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 1.verticalScale,
            child: DecoratedBox(
                decoration: BoxDecoration(color: AppColor.textDarkGrey)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.verticalScale),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              if (walletType == 'subwallet') {
                                return const SubWalletScreen();
                              } else {
                                return const MainWalletScreen();
                              }
                            },
                          ),
                        );
                      },
                      child: BottomBarrIcon()),
                  InkWell(
                      onTap: () {
                        showCoreSnackBarr(context, comingSoon);
                      },
                      child: SvgPicture.asset(
                          'assets/wallet_page/flash_icon.svg')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      child: SvgPicture.asset('assets/wallet_page/wheel.svg'))
                ]),
          ),
        ],
      ),
    );
  }
}
