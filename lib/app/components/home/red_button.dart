import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';

class RedButton extends StatelessWidget {
  final String text;
  const RedButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.verticalScale,
      width: 264.horizontalScale,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColor.buttonRed, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: redButtonStyle,
        )),
      ),
    );
  }
}
