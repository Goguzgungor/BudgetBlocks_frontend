import 'package:budget_blocks/app/components/login/login_app_barr.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/core/core_text_field.dart';
import 'package:budget_blocks/app/components/core/dark_core_text.dart';
import 'package:budget_blocks/app/components/core/headline_text.dart';
import 'package:budget_blocks/app/components/home/red_button.dart';
import 'package:budget_blocks/app/constants/app_constant.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';
import 'package:budget_blocks/app/memory/hive_manager.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/network/http_manager.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/ui/auth/screen/auth_screen.dart';
import 'package:budget_blocks/ui/landing/landing_screen.dart';
import 'package:budget_blocks/ui/login/controller/login_controller.dart';
import 'package:budget_blocks/ui/main_wallet/main_wallet_screen.dart';
import 'package:budget_blocks/ui/subwallet/subwallet_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<LoginController>();
    return Scaffold(
      appBar: LoginAppBarr(context, text: 'Budget Blocks'),
      backgroundColor: AppColor.background,
      body: SizedBox(
        width: 390.horizontalScale,
        height: 844.verticalScale,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(),
                Column(
                  children: [
                    Text(
                      'Login',
                      style: headline1.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 34.verticalScale,
                    ),
                    CoreTextField(
                      controller: controller.username_controller,
                      hintText: 'Username',
                    ),
                    SizedBox(
                      height: 17.verticalScale,
                    ),
                    CoreTextField(
                      controller: controller.pas_controller,
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: 17.verticalScale,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(),
                            ),
                          );
                        },
                        child: DarkCoreText(text: 'or Create Account'))
                  ],
                ),
                InkWell(
                    onTap: () async {
                      Map<String, dynamic> userData = {
                        "user_name": controller.username_controller.text,
                        "password": controller.pas_controller.text
                      };
                      Map<String, dynamic> resp = await HttpManager.instance
                          .postJsonRequest('/user/login', userData);
                      print(resp);

                      int user_id = resp['data']['data']['id'];

                      await controller.saveLocal(
                          HiveBoxes.USER, users_id, user_id);

                      if (resp['data']['type'] == 'mainwallet') {
                        int mainwallet_id =
                            resp['data']['data']["mainwallet_id"];
                        String? public_id = resp['data']['data']['publicKey'];
                        [HiveBoxes.MAINWALLET];
                        await controller.saveLocal(
                            HiveBoxes.USER, 'public_key', public_id);
                        await controller.saveLocal(HiveBoxes.USER,
                            HiveBoxes.MAINWALLET, mainwallet_id);
                        await controller.saveLocal(
                            HiveBoxes.USER, HiveBoxes.WALLETTYPE, 'mainwallet');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MainWalletScreen(),
                          ),
                        );
                      }
                      if (resp['data']['type'] == 'subwallet') {
                        int user_id = resp['data']['data']['id'];
                        String public_key = resp['data']['data']['public_key'];
                        await controller.saveLocal(
                            HiveBoxes.USER, 'user_id', user_id);
                        await controller.saveLocal(
                            HiveBoxes.USER, 'public_key', public_key);
                        await controller.saveLocal(
                            HiveBoxes.USER, HiveBoxes.WALLETTYPE, 'subwallet');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SubWalletScreen(),
                          ),
                        );
                      }
                    },
                    child: const RedButton(text: 'Login')),
              ]),
        ),
      ),
    );
  }
}
