import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solsafe/app/components/core/core_app_barr.dart';
import 'package:solsafe/app/components/create_wallet/create_wallet_grid.dart';
import 'package:solsafe/app/components/transaction/tran_text_block.dart';
import 'package:solsafe/app/constants/app_constant.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/network/http_manager.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';

class SubWalletListView extends StatelessWidget {
  const SubWalletListView({super.key});

  Future<Map<String, dynamic>> getList() async {
    // int user_id = int.parse(await localStorage.getId(users_id) ?? '-1');
    // return await HttpManager.instance
    //     .getJsonRequest('/user/subwallet/list/${user_id}');
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CoreAppBarr(context, text: "Subwallet List"),
        backgroundColor: AppColor.background,
        body: SizedBox(
          width: 390..horizontalScale,
          height: 890.verticalScale,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TranTextBlock(text: 'Subwallets'),
            FutureBuilder<Map<String, dynamic>>(
              future: getList(),
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
                    List subWalletList = snapshot.data?["data"];
                    print(subWalletList);
                    return Column(
                      children: [
                        SizedBox(
                          width: 220.horizontalScale,
                          height: 310.verticalScale,
                          child: Center(
                            child: ListView.builder(
                              itemCount: subWalletList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: SvgPicture.asset(
                                      'assets/wallet_page/sol_logo.svg'),
                                  title: Text(
                                    subWalletList[index]["sub_wallet_name"],
                                    style: middleBarstyle.copyWith(
                                        fontSize: 16.horizontalScale,
                                        color: AppColor.white),
                                  ),
                                  subtitle: Text(
                                    subWalletList[index]["public_key"],
                                    style: middleBarstyle.copyWith(
                                        fontSize: 8.horizontalScale,
                                        color: AppColor.white),
                                  ),
                                );
                              },
                            ),
                          ),
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
