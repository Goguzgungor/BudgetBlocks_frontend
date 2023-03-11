import 'package:flutter/material.dart';
import 'package:solsafe/app/components/core/headline_text.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/theme/text_style.dart';

class SuccessText extends StatelessWidget {
  const SuccessText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 64.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 130.horizontalScale),
              child: HeadLineText(text: 'OK!'),
            ),
            SizedBox(
              height: 20.verticalScale,
            ),
            Text(
              '''Your tokens sent 
succesfully''',
              style: headline1.copyWith(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
