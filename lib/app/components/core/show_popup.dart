import 'package:flutter/material.dart';

showPopup(BuildContext cntx, String text) {
  showDialog(
    context: cntx,
    builder: (cntx) {
      return AlertDialog(
        actions: [
          Column(
            children: [
              const SizedBox(height: 20),
              Center(child: Text(text, textAlign: TextAlign.center)),
              const SizedBox(height: 15),
            ],
          )
        ],
      );
    },
  );
}
