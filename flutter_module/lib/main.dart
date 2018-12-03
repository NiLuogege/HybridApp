import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter_module/widget/TabBarWidget.dart';
import 'common/style/Style.dart';
import 'page/DynamicPage.dart';
import 'page/MyPage.dart';
import 'page/TrendPage.dart';

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
      _renderTab(MyIcons.MAIN_DT, "动态"),
      _renderTab(MyIcons.MAIN_QS, "趋势"),
      _renderTab(MyIcons.MAIN_MY, "我的")
    ];

    List<Widget> pageViews = [
      new DynamicPage(),
      new TrendPage(),
      new MyPage(),
    ];

    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new TabBarWidget(
        type: TabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: pageViews,
        backgroundColor: Color(MyColors.red2),
        indicatorColor: Colors.blue,
      ),
    );
  }
}
