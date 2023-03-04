import 'package:flutter/material.dart';
import 'package:solsafe/app/base/base.state.dart';
import 'package:solsafe/app/components/home/card_button.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/navigation/size_config.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/app/theme/text_style.dart';

import '../../constants/padding_and_radius_size.dart';

class AmaountCard extends BaseStateless {
  const AmaountCard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      height: 200.verticalScale,
      width: 354.horizontalScale,
      decoration: BoxDecoration(
          color: AppColor.primaryContainer,
          borderRadius: BorderRadius.circular(radiusL)),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: paddingS),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Current Balance',
              style: walletCardTitle,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: dynamicWidth(context, 20),
                  top: dynamicHeight(context, 7)),
              child: Text(
                20.09875.toString(),
                style: amaountStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: dynamicHeight(context, 9.0),
                  left: dynamicWidth(context, 6)),
              child: Text(
                'SOL',
                style: amanountSolStyle,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: dynamicWidth(context, 20),
                bottom: dynamicHeight(context, 25),
                top: dynamicHeight(context, 10)),
            child: Text(
              'Text Area',
              style: areaStyle,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 10.horizontalScale,
            ),
            Expanded(
                child:
                    CardButton(AppColor.orange, 'Button 1', walletButtonStyle)),
            const SizedBox(
              width: paddingS,
            ),
            Expanded(
                child: CardButton(
                    AppColor.lightRed, 'Button 2', walletButtonStyle)),
            const SizedBox(
              width: paddingS,
            ),
            Expanded(
                child:
                    CardButton(AppColor.green, 'Button 3', walletButtonStyle)),
            SizedBox(
              width: 10.horizontalScale,
            ),
          ],
        )
      ]),
    );
  }
}
