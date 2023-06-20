import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:budget_blocks/app/base/base.state.dart';
import 'package:budget_blocks/app/constants/home/home_constant.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/navigation/size_config.dart';
import 'package:budget_blocks/app/theme/app_light_theme.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';

class LoginAppBarr extends BaseStateless implements PreferredSizeWidget {
  final String text;
  final BuildContext context;
  const LoginAppBarr(this.context, {super.key, required this.text});

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
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(dynamicHeight(context, 90.horizontalScale));
}
