import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarrIcon extends StatelessWidget {
  const BottomBarrIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SvgPicture.asset('assets/wallet_page/wallet_empty.svg')],
    );
  }
}
