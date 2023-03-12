import 'package:budgetBlocks/app/components/core/logged_core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/settings_bottom_barr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/components/core/core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/core_text_field.dart';
import 'package:budgetBlocks/app/components/core/headline_text.dart';
import 'package:budgetBlocks/app/components/create_wallet/create_wallet_grid.dart';
import 'package:budgetBlocks/app/components/home/red_button.dart';
import 'package:budgetBlocks/app/components/transaction/tran_text_block.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/network/http_manager.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';
import 'package:budgetBlocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budgetBlocks/ui/pendingTransactions/pending_transactions_view.dart';
import 'package:budgetBlocks/ui/settings/controller/settings_controller.dart';
import 'package:budgetBlocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';
import 'package:budgetBlocks/ui/subwallet_create/controller/subwallet_create_controller.dart';
import 'package:budgetBlocks/ui/subwallet_create/subwallet_create_screen.dart';
import 'package:budgetBlocks/ui/subwallet_list/subwallet_list_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<SettingsController>();
    return Scaffold(
        appBar: LoggedCoreAppBarr(context, text: "Settings"),
        bottomNavigationBar: SettingsBottomBar(),
        backgroundColor: AppColor.background,
        body: SizedBox(
          width: 390..horizontalScale,
          height: 890.verticalScale,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TranTextBlock(text: 'Settings'),
                SizedBox(
                  height: 100.verticalScale,
                ),
                Column(
                  children: [
                    Text(
                      'Edit Main Wallet',
                      style:
                          CoreAppBarrStyle.copyWith(fontSize: 24.verticalScale),
                    ),
                    SizedBox(
                      height: 15.verticalScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SubWalletCreateScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Create New Sub Wallet',
                        style: CoreAppBarrStyle.copyWith(
                            fontSize: 24.verticalScale),
                      ),
                    ),
                    SizedBox(
                      height: 15.verticalScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SubWalletListView(),
                          ),
                        );
                      },
                      child: Text(
                        'List Sub Wallets',
                        style: CoreAppBarrStyle.copyWith(
                            fontSize: 24.verticalScale),
                      ),
                    ),
                    SizedBox(
                      height: 15.verticalScale,
                    ),
                    Text(
                      'Security Settings',
                      style:
                          CoreAppBarrStyle.copyWith(fontSize: 24.verticalScale),
                    ),
                    SizedBox(
                      height: 15.verticalScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const PendingTransactionsListView(),
                          ),
                        );
                      },
                      child: Text(
                        'Pending Transactions',
                        style: CoreAppBarrStyle.copyWith(
                            fontSize: 24.verticalScale),
                      ),
                    ),
                    SizedBox(
                      height: 15.verticalScale,
                    ),
                    Text(
                      'About',
                      style:
                          CoreAppBarrStyle.copyWith(fontSize: 24.verticalScale),
                    ),
                    SizedBox(
                      height: 15.verticalScale,
                    ),
                  ],
                ),
              ]),
        ));
  }
}
