import 'package:budget_blocks/app/components/core/core_scafflod_messenger.dart';
import 'package:budget_blocks/ui/qr_reader/qr_reader.dart';
import 'package:budget_blocks/ui/recieve/receive.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/components/core/bottom_bar.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/core/dark_core_text.dart';
import 'package:budget_blocks/app/components/main_wallet/main_wallet_button.dart';
import 'package:budget_blocks/app/constants/app_constant.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/network/http_manager.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/main_wallet/controller/main_wallet_controller.dart';
import 'package:budget_blocks/ui/subwallet/controller/subwallet_controller.dart';
import 'package:budget_blocks/ui/transaction/transaction_screen.dart';

import '../../../app/components/core/logged_core_app_barr.dart';

class SubWalletView extends StatelessWidget {
  const SubWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    int lamport_to_sol = 1000000000;
    final controller = Get.find<SubWalletController>();
    Future<Map<String, dynamic>> getDatas() async {
      int user_id =
          HiveManager.instance.getMapFromBox(HiveBoxes.USER, users_id);
      return await HttpManager.instance
          .getJsonRequest('/user/balance/subwallet/${user_id}');
    }

    dynamic balance = 0.0;

    return Scaffold(
      appBar: LoggedCoreAppBarr(context),
      backgroundColor: AppColor.background,
      bottomNavigationBar: CustomBottomBar(),
      body: Center(
        child: SizedBox(
            width: 390.horizontalScale,
            height: 890.verticalScale,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const QrReader(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0.horizontalScale),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                              'assets/wallet_page/qr_icon.svg')),
                    ),
                  ),
                  SizedBox(
                    height: 50.verticalScale,
                  ),
                  Column(
                    children: [
                      FutureBuilder<Map<String, dynamic>>(
                        future: getDatas(),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot,
                        ) {
                          print(snapshot.connectionState);
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Text(
                                'Error',
                                style: middleBarstyle.copyWith(
                                    fontSize: 24.horizontalScale),
                              );
                            } else if (snapshot.hasData) {
                              print(snapshot.data);
                              dynamic balance = snapshot.data?["data"];
                              return Column(
                                children: [
                                  Center(
                                    child: Text(
                                      '${balance} SOL',
                                      style: headline1.copyWith(fontSize: 48),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                'Empty data',
                                style: middleBarstyle.copyWith(
                                    fontSize: 24.horizontalScale),
                              );
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                        },
                      ),
                      SizedBox(
                        height: 47.verticalScale,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TransactionScreen(
                                      balance: balance,
                                    ),
                                  ),
                                );
                              },
                              child: MainWalletButton(text: 'Send')),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ReceiveScreen(),
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 11.0.horizontalScale,
                                  right: 11.horizontalScale),
                              child: MainWalletButton(text: 'Receive'),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                showCoreSnackBarr(context, comingSoon);
                              },
                              child: MainWalletButton(text: 'Swap')),
                        ],
                      ),
                      SizedBox(
                        height: 20.verticalScale,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Tokens',
                                style: headline1.copyWith(
                                  fontSize: 18.verticalScale,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    showCoreSnackBarr(context, comingSoon);
                                  },
                                  child: DarkCoreText(text: 'NFTs')),
                              Text(
                                'NFTs',
                                style: textFieldStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.verticalScale,
                          ),
                          SizedBox(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: AppColor.textDarkGrey))),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
