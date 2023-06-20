import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';

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
