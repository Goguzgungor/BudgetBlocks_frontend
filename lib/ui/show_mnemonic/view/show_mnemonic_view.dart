import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/components/core/core_app_barr.dart';
import 'package:budgetBlocks/app/components/core/headline_text.dart';
import 'package:budgetBlocks/app/components/create_wallet/create_wallet_grid.dart';
import 'package:budgetBlocks/app/components/home/red_button.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/memory/hive_boxes.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/network/http_manager.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';
import 'package:budgetBlocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budgetBlocks/ui/show_mnemonic/controller/show_mnemonic_controller.dart';

class ShowMnemonicView extends StatelessWidget {
  final int user_id;
  const ShowMnemonicView({super.key, required this.user_id});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<ShowMnemonicController>();

    return Scaffold(
        appBar: CoreAppBarr(context, text: "Create New Wallet"),
        backgroundColor: AppColor.background,
        body: SizedBox(
          width: 390..horizontalScale,
          height: 890.verticalScale,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            HeadLineText(text: 'Recovery Phrase'),
            SizedBox(
              height: 50.verticalScale,
            ),
            FutureBuilder<Map<String, dynamic>>(
              future: HttpManager.instance
                  .getJsonRequest('/user/create/userwallet/${user_id}'),
              builder: (
                BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot,
              ) {
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text(
                      'Error',
                      style:
                          middleBarstyle.copyWith(fontSize: 24.horizontalScale),
                    );
                  } else if (snapshot.hasData) {
                    print(snapshot.data);
                    int mainwalletId = snapshot.data?["data"]['mainwallet_id'];
                    String public_key =
                        snapshot.data?["data"][HiveConst.publicKey];
                    List mnemonicList = snapshot.data?["data"]["mnemonic"];
                    return Column(
                      children: [
                        SizedBox(
                          width: 220.horizontalScale,
                          height: 310.verticalScale,
                          child: Center(
                            child: CreateWalletGrid(
                              mnemonicList: mnemonicList,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() => Checkbox(
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                        fillColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                        value: controller.isOkey,
                                        onChanged: (value) {
                                          controller.changePermission();
                                        },
                                      )),
                                  Text(
                                    '''I have saved my recovery phrase in a
secure place''',
                                    style: middleBarstyle.copyWith(
                                        fontSize: 16.horizontalScale,
                                        color: AppColor.white),
                                  ),
                                ]),
                            SizedBox(
                              height: 20.verticalScale,
                            ),
                            InkWell(
                                onTap: () async {
                                  await HiveManager.instance.addMapToBox(
                                      HiveBoxes.USER,
                                      HiveBoxes.MAINWALLET,
                                      mainwalletId);
                                  await HiveManager.instance.addMapToBox(
                                      HiveBoxes.USER,
                                      HiveConst.publicKey,
                                      public_key);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MainWalletScreen(),
                                    ),
                                  );
                                },
                                child: RedButton(text: 'Approve'))
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Text(
                      'Empty data',
                      style:
                          middleBarstyle.copyWith(fontSize: 24.horizontalScale),
                    );
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
          ]),
        ));
  }
}
