import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solsafe/app/extensions/widgets_scale_extension.dart';

class BottomBarrIcon extends StatelessWidget {
  const BottomBarrIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/wallet_page/wallet_icon.png'),
      ],
    );
  }
}
