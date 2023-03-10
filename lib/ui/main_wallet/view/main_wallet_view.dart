import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/components/core/bottom_bar.dart';
import 'package:solsafe/app/components/core/core_app_barr.dart';
import 'package:solsafe/app/components/core/dark_core_text.dart';
import 'package:solsafe/app/components/main_wallet/main_wallet_button.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/memory/hive_boxes.dart';
import 'package:solsafe/app/memory/hive_manager.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/network/http_manager.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/main_wallet/controller/main_wallet_controller.dart';
import 'package:solsafe/ui/transaction/transaction_screen.dart';

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
      appBar: CoreAppBarr(context, text: 'Main Wallet'),
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
                              print(snapshot.data);
                              print(snapshot.data);
                              print(snapshot.data);
                              print(snapshot.data);

                              

                                         dynamic balance = 
                                  snapshot.data?["data"]['balance'];
                            

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
                                    builder: (context) =>
                                        const TransactionScreen(),
                                  ),
                                );
                              },
                              child: MainWalletButton(text: 'Send')),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 11.0.horizontalScale,
                                right: 11.horizontalScale),
                            child: MainWalletButton(text: 'Receive'),
                          ),
                          MainWalletButton(text: 'Swap'),
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
                                'TOKENs',
                                style: headline1.copyWith(
                                  fontSize: 18.verticalScale,
                                ),
                              ),
                              DarkCoreText(text: 'NFTs'),
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
