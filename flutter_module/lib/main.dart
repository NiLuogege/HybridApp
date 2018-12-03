import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter_module/widget/TabBarWidget.dart';
import 'common/style/Style.dart';

void main() => runApp(new MyApp());
//void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return new MyApp();
  }
}

_renderTab(icon, text) {
  return new Tab(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          icon,
          size: 16.0,
        ),
        new Text(text)
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(MyIcons.MAIN_DT, "Dynamic"),
      _renderTab(MyIcons.MAIN_DT, "Dynamic"),
      _renderTab(MyIcons.MAIN_DT, "Dynamic")
    ];

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TabBarWidget(
        type: TabBarWidget.TOP_TAB,
        tabItems: tabs,
        tabViews: tabs,
      ),
    );
  }
}
