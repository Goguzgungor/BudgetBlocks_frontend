import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:budget_blocks/app/extensions/widgets_scale_extension.dart';
import 'package:budget_blocks/app/theme/colors.dart';
import 'package:budget_blocks/app/theme/text_style.dart';

class CreateWalletGrid extends StatelessWidget {
  final List mnemonicList;
  const CreateWalletGrid({super.key, required this.mnemonicList});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 120 / 36,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: List.generate(12, (index) {
          return Center(
            child: Row(
              children: [
                Text(
                  (index + 1).toString(),
                  style: middleBarstyle.copyWith(
                      fontSize: 16.horizontalScale,
                      color: AppColor.textDarkGrey),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.horizontalScale),
                  child: Text(
                    mnemonicList[index],
                    style:
                        middleBarstyle.copyWith(fontSize: 24.horizontalScale),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
