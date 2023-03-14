import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';

class TranTextBlock extends StatelessWidget {
  final String text;
  const TranTextBlock({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.horizontalScale,
        ),
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/wallet_page/arrow_icon.svg')),
        SizedBox(
          width: 20.horizontalScale,
        ),
        Text(
          text,
          style: amanountSolStyle.copyWith(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
