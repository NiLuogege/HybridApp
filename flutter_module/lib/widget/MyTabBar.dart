import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget child;

  MyTabBar(@required this.child) : assert(child != null);

  @override
  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }

  @override
  State<StatefulWidget> createState() {
    return new MyTabBarState();
  }
}

class MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.black26,
      child: new SafeArea(top: true, child: widget.child),
    );
  }
}
