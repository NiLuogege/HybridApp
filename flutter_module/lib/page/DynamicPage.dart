import 'package:flutter/material.dart';
import 'dart:ui';

class DynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.blueAccent,
      child: new Center(
        child: new Text(
          "DynamicPage",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
