import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solsafe/app/theme/text_style.dart';

class HeadLineText extends StatelessWidget {
  final String text;
  const HeadLineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: headline1,
    );
  }
}
