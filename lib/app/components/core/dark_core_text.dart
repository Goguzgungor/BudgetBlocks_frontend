import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';

class DarkCoreText extends StatelessWidget {
  final String text;
  const DarkCoreText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textFieldStyle.copyWith(color: AppColor.textDarkGrey),
    );
  }
}
