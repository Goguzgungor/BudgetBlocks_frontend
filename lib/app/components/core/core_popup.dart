import 'package:flutter/material.dart';
import 'dart:async';

class CorePopUp extends StatefulWidget {
  final Future future;

  const CorePopUp({Key? key, required this.future}) : super(key: key);
  @override
  _CorePopUpState createState() => _CorePopUpState();
}

class _CorePopUpState extends State<CorePopUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Text(snapshot.data[0].text),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return DecoratedBox(
                decoration: BoxDecoration(),
                child: SizedBox(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
