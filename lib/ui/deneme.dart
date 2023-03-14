import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DenemeView extends StatelessWidget {
  const DenemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: QrImage(
                        data: "1234567890",
                        version: QrVersions.auto,
                      ),
                    ),
                  ),
                ));
              },
              child: Text('Get qr'))
        ]),
      ),
    );
  }
}
