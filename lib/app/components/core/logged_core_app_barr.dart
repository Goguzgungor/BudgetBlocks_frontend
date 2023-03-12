import 'package:budgetBlocks/app/components/core/core_scafflod_messenger.dart';
import 'package:budgetBlocks/app/components/core/dark_core_text.dart';
import 'package:budgetBlocks/app/constants/app_constant.dart';
import 'package:budgetBlocks/app/extensions/string_extension.dart';
import 'package:budgetBlocks/app/memory/hive_boxes.dart';
import 'package:budgetBlocks/app/memory/hive_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:budgetBlocks/app/base/base.state.dart';
import 'package:budgetBlocks/app/constants/home/home_constant.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/navigation/size_config.dart';
import 'package:budgetBlocks/app/theme/app_light_theme.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';

class LoggedCoreAppBarr extends BaseStateless implements PreferredSizeWidget {
  final String text;
  final BuildContext context;
  const LoggedCoreAppBarr(this.context, {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    String pubKey =
        HiveManager.instance.getMapFromBox(HiveBoxes.USER, HiveConst.publicKey);
    return Column(
      children: [
        SizedBox(
          height: 40.horizontalScale,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/app_barr_logo.png'),
            SizedBox(
              width: 10.verticalScale,
            ),
            Column(
              children: [
                Text(
                  text,
                  style: CoreAppBarrStyle,
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: pubKey));
                    showCoreSnackBarr(context, 'Copied To Clipboard');
                  },
                  child: DarkCoreText(
                      text: pubKey.take(4) +
                          '....' +
                          pubKey.substring(pubKey.length - 4)),
                )
              ],
            ),
            SizedBox(
              width: 100.verticalScale,
            ),
            InkWell(
                onTap: () {
                  showCoreSnackBarr(context, comingSoon);
                },
                child: SvgPicture.asset('assets/wallet_page/dropdown.svg'))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 14.verticalScale),
          child: SizedBox(
            height: 1.verticalScale,
            width: 390.verticalScale,
            child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xff535353))),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(dynamicHeight(context, 100.horizontalScale));
}
