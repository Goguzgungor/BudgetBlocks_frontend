import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';

class SolMiddleBarr extends StatelessWidget {
  final dynamic balance;
  const SolMiddleBarr({
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
              SvgPicture.asset('assets/wallet_page/sol_logo.svg'),
              SizedBox(
                width: 21.horizontalScale,
              ),
              Text(
                'Solana',
                style: middleBarStyle,
              ),
            ],
          ),
          Text(
            '\$${balance} Sol',
            style: middleBarStyle.copyWith(
                fontSize: 14.verticalScale, color: AppColor.textDarkGrey),
          ),
          Text(
            '\$${balance * 22} ',
            style: middleBarStyle.copyWith(fontSize: 14.verticalScale),
          ),
        ]),
      ),
    );
  }
}
