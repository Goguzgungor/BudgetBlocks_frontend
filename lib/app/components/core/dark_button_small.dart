import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';

class DarkButtonSmall extends StatelessWidget {
  final String text;
  const DarkButtonSmall({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.verticalScale,
      width: 55.horizontalScale,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColor.textDarkGrey,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: redButtonStyle.copyWith(fontSize: 12.verticalScale),
        )),
      ),
    );
  }
}
