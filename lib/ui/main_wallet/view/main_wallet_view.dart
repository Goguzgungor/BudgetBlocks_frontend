import 'package:budgetBlocks/app/components/core/core_scafflod_messenger.dart';
import 'package:budgetBlocks/app/components/core/logged_core_app_barr.dart';
import 'package:budgetBlocks/app/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/components/core/bottom_bar.dart';
import 'package:budgetBlocks/app/components/core/core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/dark_core_text.dart';
import 'package:budgetBlocks/app/components/main_wallet/main_wallet_button.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/memory/hive_boxes.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/network/http_manager.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';
import 'package:budgetBlocks/ui/main_wallet/controller/main_wallet_controller.dart';
import 'package:budgetBlocks/ui/qr_reader/qr_reader.dart';
import 'package:budgetBlocks/ui/recieve/receive.screen.dart';
import 'package:budgetBlocks/ui/transaction/transaction_screen.dart';

class MainWalletView extends StatelessWidget {
  const MainWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<MainWalletController>();
    getDatas() async {
      int mainwallet_id = HiveManager.instance
          .getMapFromBox(HiveBoxes.USER, HiveBoxes.MAINWALLET);
      return await HttpManager.instance
          .getJsonRequest('/user/balance/${mainwallet_id}');
    }

    return Scaffold(
      appBar: LoggedCoreAppBarr(context, text: 'Main Wallet'),
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
                              dynamic balance =
                                  snapshot.data?["data"]['balance'];
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/wallet_page/sol_logo.svg'),
                                      SizedBox(
                                        width: 20.horizontalScale,
                                      ),
                                      Text(
                                        '${balance}',
                                        style: headline1.copyWith(fontSize: 48),
                                      ),
                                      Text(
                                        ' SOL',
                                        style: headline1.copyWith(fontSize: 38),
                                      ),
                                    ],
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
                                    builder: (context) =>
                                        const TransactionScreen(),
                                  ),
                                );
                              },
                              child: MainWalletButton(text: 'Send')),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ReceiveScreen(),
                                ),
                              );
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
