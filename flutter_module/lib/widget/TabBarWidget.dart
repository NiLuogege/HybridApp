import 'package:flutter/material.dart';
import '../widget/MyTabBar.dart';

///tabBar 和 TabBarView 封装
class TabBarWidget extends StatefulWidget {
  ///底部模式type
  static const int BOTTOM_TAB = 1;

  ///顶部模式type
  static const int TOP_TAB = 2;

  final int type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color backgroundColor;
  final Color indicatorColor;

  TabBarWidget({
    Key key,
    this.type,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _TabBarState(
        type,
        tabViews,
        backgroundColor,
        indicatorColor,
      );
}

class _TabBarState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  final int _type;

  final List<Widget> _tabViews;

  final Color _backgroundColor;

  final Color _indicatorColor;

  _TabBarState(
      this._type, this._tabViews, this._backgroundColor, this._indicatorColor)
      : super();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: widget.tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //顶部tab
    if (this._type == TabBarWidget.TOP_TAB) {
      return new Scaffold(
//        floatingActionButton: _floatingActionButton,
//        persistentFooterButtons:
//            _tarWidgetControl == null ? [] : _tarWidgetControl.footerButton,
        appBar: new MyTabBar(
            new TabBar(
              controller: _tabController,
              tabs: widget.tabItems,
              indicatorColor: _indicatorColor,
            ),
            _backgroundColor),
        body: new TabBarView(
          children: _tabViews,
          controller: _tabController,
        ),
      );
    }

    return new Scaffold(
        body: new TabBarView(
          children: _tabViews,
          controller: _tabController,
        ),
        bottomNavigationBar: new Material(
          color: _backgroundColor,
          child: new TabBar(
            controller: _tabController,
            tabs: widget.tabItems,
            indicatorColor: _indicatorColor,
          ),
        ));
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
