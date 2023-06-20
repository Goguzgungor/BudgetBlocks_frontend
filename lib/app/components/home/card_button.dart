import 'package:flutter/material.dart';
import 'package:budget_blocks/app/base/base.state.dart';
import 'package:budget_blocks/app/constants/padding_and_radius_size.dart';

class CardButton extends BaseStateless {
  final TextStyle style;
  final Color color;
  final String text;
  const CardButton(this.color, this.text, this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
        child: SizedBox(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingXS),
          child: Center(
              child: Text(
            text,
            style: style,
          )),
        )));
  }
}
