import 'package:flutter/material.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';

class BigDarkButton extends StatelessWidget {
  final String text;
  const BigDarkButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.verticalScale,
      width: 264.horizontalScale,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColor.textDarkGrey,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: redButtonStyle,
        )),
      ),
    );
  }
}
