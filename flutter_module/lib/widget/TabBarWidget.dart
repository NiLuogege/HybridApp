import 'package:flutter/material.dart';
import '../widget/MyTabBar.dart';

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
  final Widget title;
  final Widget drawer;
  final Widget floatingActionButton;
  final TarWidgetControl tarWidgetControl;
  final PageController topPageController;
  final ValueChanged<int> onPageChanged;

  TabBarWidget(
      {Key key,
      this.type,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title,
      this.drawer,
      this.floatingActionButton,
      this.tarWidgetControl,
      this.topPageController,
      this.onPageChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _TabBarState(
        type,
        tabViews,
      );
}

class _TabBarState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  final int _type;

  final List<Widget> _tabViews;

//
//  final Color _indicatorColor;
//
//  final Widget _title;
//
//  final Widget _drawer;
//
//  final Widget _floatingActionButton;
//
//  final TarWidgetControl _tarWidgetControl;
//
//  final PageController _pageController;
//
//  final ValueChanged<int> _onPageChanged;

  _TabBarState(this._type, this._tabViews) : super();

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
            new TabBar(controller: _tabController, tabs: widget.tabItems),
            0xffff0000),
        body: new PageView(
          children: _tabViews,
        ),
      );
    }

    return null;
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
