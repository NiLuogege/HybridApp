import 'package:flutter/material.dart';
import 'dart:ui';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.redAccent,
      child: new Center(
        child: new Text(
          "MyPage",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
