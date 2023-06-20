import 'package:budget_blocks/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/theme/text_style.dart';

class CoreTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CoreTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264.horizontalScale,
      height: 44.verticalScale,
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffD9D9D9)),
          child: Center(
            child: TextFormField(
              style: textFieldStyle.copyWith(color: AppColor.background),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be null';
                }
              },
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15),
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: textFieldStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
