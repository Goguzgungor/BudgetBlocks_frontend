import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/theme/text_style.dart';

class TranTextBlock extends StatelessWidget {
  const TranTextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.horizontalScale,
        ),
        SvgPicture.asset('assets/wallet_page/arrow_icon.svg'),
        SizedBox(
          width: 20.horizontalScale,
        ),
        Text(
          'You are sending',
          style: amanountSolStyle,
        ),
      ],
    );
  }
}
