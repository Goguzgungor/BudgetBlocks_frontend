import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/theme/text_style.dart';

class MiddleBar extends StatelessWidget {
  final TextStyle style;
  final Color color;
  final String text;
  const MiddleBar(
      {super.key,
      required this.style,
      required this.color,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Text(
          text,
          style: middleBarstyle.copyWith(color: color),
        ),
        SizedBox(
          height: 10.verticalScale,
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: color),
          child: SizedBox(
            height: 1.verticalScale,
            width: 110.horizontalScale,
          ),
        )
      ],
    ));
  }
}
