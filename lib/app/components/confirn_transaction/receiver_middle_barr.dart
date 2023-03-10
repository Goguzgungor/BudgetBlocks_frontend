import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solsafe/app/extensions/string_extension.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';

class ReceiverMiddleBarr extends StatelessWidget {
  final dynamic balance;
  const ReceiverMiddleBarr({
    super.key,
    this.balance,
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
                'Viyana Caffe Shop',
                style: middleBarStyle,
              ),
            ],
          ),
          Text(
            '\$${balance.toString() * 20}'.take(8) + '...',
            style: middleBarStyle.copyWith(
                fontSize: 14.verticalScale, color: AppColor.textDarkGrey),
          ),
        ]),
      ),
    );
  }
}
