import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:budgetBlocks/app/extensions/string_extension.dart';
import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/theme/colors.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';

class ReceiverMiddleBarr extends StatelessWidget {
  final String publicKey;
  const ReceiverMiddleBarr({
    super.key,
    required this.publicKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 63.verticalScale,
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppColor.greyBackground),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: [
              Text(
                'To: ',
                style: middleBarStyle.copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                'Unknown',
                style: middleBarStyle,
              ),
            ],
          ),
          Text(
            publicKey.take(8) + '...',
            style: middleBarStyle.copyWith(
                fontSize: 14.verticalScale, color: AppColor.textDarkGrey),
          ),
        ]),
      ),
    );
  }
}
