import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/auth/controller/auth_controller.dart';
import 'package:budget_blocks/ui/home/controller/home_controller.dart';
import 'package:budget_blocks/ui/import_wallet/controller/import_wallet_controller.dart';
import 'package:budget_blocks/ui/landing/landing_screen.dart';
import 'package:budget_blocks/ui/login/screen/login_screen.dart';
import 'package:hive/hive.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<AuthController>();
    return Scaffold(
      appBar: CoreAppBarr(context, text: 'Create Wallet'),
      backgroundColor: AppColor.background,
      body: SizedBox(
        width: 390.horizontalScale,
        height: 844.verticalScale,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HeadLineText(text: 'Create a user'),
                Column(
                  children: [
                    CoreTextField(
                      controller: controller.username_controller,
                      hintText: 'User name',
                    ),
                    SizedBox(
                      height: 17.verticalScale,
                    ),
                    CoreTextField(
                      controller: controller.pas_controller,
                      hintText: 'Set password',
                    ),
                    SizedBox(
                      height: 17.verticalScale,
                    ),
                    CoreTextField(
                      controller: controller.re_pas_controller,
                      hintText: 'Repeat password',
                    ),
                    SizedBox(
                      height: 20.verticalScale,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: DarkCoreText(text: 'or Login'))
                  ],
                ),
                InkWell(
                    onTap: () async {
                      Map<String, dynamic> userData = {
                        "user_name": controller.username_controller.text,
                        "e_mail": "example@example.com",
                        "password": controller.re_pas_controller.text
                      };
                      Map<String, dynamic> resp = await HttpManager.instance
                          .postJsonRequest('/user/create', userData);
                      int user_id = resp['data']['id'];
                      HiveManager.instance
                          .addMapToBox(HiveBoxes.USER, 'user_id', user_id);
                      int user1 = HiveManager.instance
                          .getMapFromBox(HiveBoxes.USER, 'user_id');
                      await HiveManager.instance.addMapToBox(HiveBoxes.USER,HiveBoxes.WALLETTYPE,HiveBoxes.MAINWALLET);

                      print(user1);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LandingScreen(),
                        ),
                      );
                    },
                    child: const RedButton(text: 'Create')),
              ]),
        ),
      ),
    );
  }
}
