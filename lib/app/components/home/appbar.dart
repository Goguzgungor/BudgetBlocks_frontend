import 'package:flutter/material.dart';
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

class HomeAppBar extends BaseStateless implements PreferredSizeWidget {
  final BuildContext context;
  const HomeAppBar(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
            Text(
              budgetb_text,
              style: AppBarrStyle,
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(dynamicHeight(context, 90.horizontalScale));
}
