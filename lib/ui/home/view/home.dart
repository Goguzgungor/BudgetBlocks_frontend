import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/base/base.state.dart';
import 'package:solsafe/app/components/core/core_text_field.dart';
import 'package:solsafe/app/components/home/amaount_card.dart';
import 'package:solsafe/app/components/home/appbar.dart';
import 'package:solsafe/app/components/home/card_button.dart';
import 'package:solsafe/app/components/home/red_button.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/theme/app_light_theme.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';
import 'package:solsafe/ui/auth/screen/auth_screen.dart';
import 'package:solsafe/ui/home/controller/home_controller.dart';
import 'package:solsafe/ui/import_wallet/screen/import_wallet_screen.dart';

import '../../../app/components/home/middle_bar.dart';
import '../../../app/constants/home/home_constant.dart';

class HomeView extends BaseStateless {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final controller = Get.find<HomeViewController>();
    return Scaffold(
      appBar: HomeAppBar(context),
      backgroundColor: AppColor.background,
      key: controller.scaffoldKey,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 390.horizontalScale,
            minHeight: 844.verticalScale,
            maxWidth: 390.horizontalScale,
            maxHeight: 844.verticalScale,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  welcome_text,
                  style: headline1,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 264.horizontalScale,
                      height: 44.verticalScale,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffD9D9D9)),
                        child: Center(
                            child: CoreTextField(
                                controller: controller.controller,
                                hintText: 'Password')),
                      ),
                    ),
                    SizedBox(
                      height: 20.verticalScale,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ImportWalletScreen(),
                            ),
                          );
                        },
                        child: RedButton(text: 'Unlock'))
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
