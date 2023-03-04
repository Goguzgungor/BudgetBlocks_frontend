import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/components/core/core_app_barr.dart';
import 'package:solsafe/app/components/core/core_text_field.dart';
import 'package:solsafe/app/components/core/headline_text.dart';
import 'package:solsafe/app/components/home/red_button.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/memory/hive_boxes.dart';
import 'package:solsafe/app/memory/hive_manager.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/network/http_manager.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/auth/controller/auth_controller.dart';
import 'package:solsafe/ui/home/controller/home_controller.dart';
import 'package:solsafe/ui/import_wallet/controller/import_wallet_controller.dart';
import 'package:solsafe/ui/landing/landing_screen.dart';

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
