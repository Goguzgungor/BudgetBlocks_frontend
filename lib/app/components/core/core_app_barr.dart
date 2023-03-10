import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solsafe/app/base/base.state.dart';
import 'package:solsafe/app/constants/home/home_constant.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/theme/app_light_theme.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';

class CoreAppBarr extends BaseStateless implements PreferredSizeWidget {
  final String text;
  final BuildContext context;
  const CoreAppBarr(this.context, {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Column(
      children: [
        SizedBox(
          height: 30.horizontalScale,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/app_barr_logo.png'),
            SizedBox(
              width: 10.verticalScale,
            ),
            Text(
              text,
              style: CoreAppBarrStyle,
            ),
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
      Size.fromHeight(dynamicHeight(context, 90.horizontalScale));
}
