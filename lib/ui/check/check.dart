import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:budget_blocks/ui/main_wallet/main_wallet_screen.dart';

class CheckView extends StatelessWidget {
  final String text;
  const CheckView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(text),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainWalletScreen(),
                ),
              );
            },
            child: Text('Okay'))
      ]),
    );
  }
}
