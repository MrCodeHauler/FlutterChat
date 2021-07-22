import 'package:flutter/material.dart';

import 'package:hello_world/home.dart';
import 'package:hello_world/pages/school/ReorderableList.dart';
import 'package:hello_world/pages/school/buttonDemo.dart';
import 'package:hello_world/pages/school/layout/alignLayoutPage.dart';
import 'package:hello_world/pages/school/layout/centerLayoutPage.dart';
import 'package:hello_world/pages/school/layoutListPage.dart';
import 'package:hello_world/pages/school/miniGame.dart';
import 'package:hello_world/pages/school/sliverDemoPage.dart';
import 'package:hello_world/pages/school/tableViewDemoPage.dart';
import 'package:hello_world/state/manageByParent.dart';
import 'package:hello_world/state/manageBySelf.dart';
import 'package:hello_world/state/manageByMixed.dart';
import 'package:hello_world/list/scrollbarList.dart';
import 'package:hello_world/list/separatorList.dart';

class BGRoute {
  static final String initialRoute = "/";
  static final Map<String, WidgetBuilder> routes = {
    "/": (context) => MyHomePage(title: 'Flutter'),
    "miniGame": (context) => MiniGame(),
    "new_page": (context) => NewRoute(),
    "manageBySelf": (context) => TapboxA(),
    "manageByParent": (context) => ParentWidget(),
    "manageByMixed": (context) => ParentWidgetC(),
    "TestReorderableListView": (context) => TestReorderableListView(),
    "letterList": (context) => LetterList(),
    "separatorList": (context) => SeparatorList(),
    // Layout
    "LayoutListPage": (context) => LayoutListPage(),
    "CenterLayoutDemo": (context) => CenterLayoutDemo(),
    // "PaddingLayoutPage": (context) =>
    "AlignLayoutDemo": (context) => AlignLayoutDemo(),
    // button
    "ButtonDemo": (context) => ButtonDemo(),
    'SliverDemo': (context) => SimpleDemoPageBody(),
    // Dialog
    // "TestDialogPage": (context) =>
  };
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('new route')),
      body: Center(child: Text('This is a new route')),
    );
  }
}
