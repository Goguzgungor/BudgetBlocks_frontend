import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';

class DarkButton extends StatelessWidget {
  final String text;
  const DarkButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.verticalScale,
      width: 125.horizontalScale,
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
