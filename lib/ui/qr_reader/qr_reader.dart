import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:solsafe/app/theme/colors.dart';
import 'package:solsafe/ui/confirm_transaction/confirm_transaction_screen.dart';
import 'package:solsafe/ui/transaction/transaction_screen.dart';

class QrReader extends StatefulWidget {
  const QrReader({Key? key}) : super(key: key);

  @override
  State<QrReader> createState() => _QrReaderState();
}

class _QrReaderState extends State<QrReader> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? result;
  QRViewController? controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: AppColor.background,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.stopCamera();
    controller.scannedDataStream.listen((scanData) {
      if (scanData != '') {
        setState(() {
          result = scanData.code;
        });
        print(result);
        controller.stopCamera();
        List<String> splitResult = result.toString().split(' ');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ConfirmTransactionScreen(
              balance: splitResult[1],
              publicKey: splitResult[0],
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
