import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/components/core/core_app_barr.dart';
import 'package:budget_blocks/app/components/home/red_button.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/network/http_manager.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';
import 'package:budget_blocks/ui/create_wallet/controller/create_wallet_controller.dart';
import 'package:budget_blocks/ui/show_mnemonic/show_mnemonic_screen.dart';

import '../../../app/constants/app_constant.dart';

class CreateWalletView extends StatelessWidget {
  const CreateWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final controller = Get.find<CreateWalletController>();
    return Scaffold(
      appBar: CoreAppBarr(
        context,
        text: 'Create New Wallet',
      ),
      backgroundColor: AppColor.background,
      body: SizedBox(
        width: 390.horizontalScale,
        height: 844.verticalScale,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            '''Please read
carefully''',
            style: headline1,
          ),
          Text(
            '''In the next screen we will show you
your recovery phrase (12 words).
If somebody gets your recovery phrase
they can get full control of your wallet
and your assets.
Never share your recovery phrase
with anyone. We will never ask you
for it.
Keeping it in a digital medium is a
risk. Many people prefer to write it
down to a paper.
Please make sure that you keep your
recovery phrase somewhere you will
have access.
''',
            style: headline1.copyWith(fontSize: 16),
          ),
          InkWell(
              onTap: () async {
                int user_id = controller.getLocal(HiveBoxes.USER, users_id);

                print(user_id);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShowMnemonicScreen(
                      user_id: user_id,
                    ),
                  ),
                );
              },
              child: RedButton(text: 'Show my Recovery Phrase'))
        ]),
      ),
    );
  }
}
