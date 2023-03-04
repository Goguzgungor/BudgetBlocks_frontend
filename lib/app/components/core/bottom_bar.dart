import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solsafe/app/components/core/bottombar_icon.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';
import 'package:solsafe/app/theme/colors.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90.verticalScale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 1.verticalScale,
            child: DecoratedBox(
                decoration: BoxDecoration(color: AppColor.textDarkGrey)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.verticalScale),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomBarrIcon(),
                  Image.asset('assets/wallet_page/flash_icon.png'),
                  Image.asset('assets/wallet_page/wheel_icon.png')
                ]),
          ),
        ],
      ),
    );
  }
}
