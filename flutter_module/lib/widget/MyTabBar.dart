import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget child;
  final Color backgroundColor;

  MyTabBar(this.child, this.backgroundColor) : assert(child != null);

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
      color: widget.backgroundColor,
      child: new SafeArea(top: true, child: widget.child),
    );
  }
}
