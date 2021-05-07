import 'package:flutter/material.dart';

import 'package:hello_world/home.dart';
import 'package:hello_world/state/manageByParent.dart';
import 'package:hello_world/state/manageBySelf.dart';
import 'package:hello_world/state/manageByMixed.dart';
import 'package:hello_world/list/scrollbarList.dart';
import 'package:hello_world/list/separatorList.dart';

class BGRoute {
  static final String initialRoute = "/";
  static final Map<String, WidgetBuilder> routes = {
    "/": (context) => MyHomePage(title: 'Flutter'),
    "new_page": (context) => NewRoute(),
    "manageBySelf": (context) => TapboxA(),
    "manageByParent": (context) => ParentWidget(),
    "manageByMixed": (context) => ParentWidgetC(),
    "letterList": (context) => LetterList(),
    "separatorList": (context) => SeparatorList(),
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