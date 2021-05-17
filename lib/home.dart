import 'package:flutter/material.dart';
import 'package:hello_world/common/bgBottomSheet.dart';
import 'package:hello_world/common/bgDialog.dart';
import 'package:hello_world/common/bgListView.dart';

import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final List<String> entries = <String>[
    '牌杀小游戏',
    'Layout',
    'ReorderableListView'
    'ListView',
    'Button',
    'Dialog',
    'BottomSheet'
    'ImagePicker',
    'Loading',
    'DateImagePicker',
    'Toast',
    'TextField'
  ];

  @override
  void initState() {
    super.initState();
    // 初始化状态
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏
        title: Text(widget.title),
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
      ),
      drawer: new LeftDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'School', icon: Icon(Icons.school)),
          BottomNavigationBarItem(
              label: 'Business', icon: Icon(Icons.business)),
          BottomNavigationBarItem(label: 'Me', icon: Icon(Icons.verified_user)),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: BGListView(
          listData: entries,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.book), // 左边Icon
              title: Text('Entry ${entries[index]}'), // 主标题
              trailing: Icon(Icons.arrow_right), // 右边Icon
            );
          },
          didClickItem: didClickItem
        )
      ),
    );
  }

  void didClickItem(int index) {
    switch (index) {
      case 0:
        // 牌杀小游戏
        Navigator.pushNamed(context, 'miniGame');
        break;
      case 1:
        // Layout
        Navigator.pushNamed(context, 'LayoutListPage');
        break;
      case 2:
        // TestReorderableListView
        Navigator.pushNamed(context, 'TestReorderableListView');
        break;
      case 3:
        // button
        Navigator.pushNamed(context, 'TestButtonPage');
        break;
      case 4:
        // Dialog
        BGDialog.showGlobalDialog(context);
        // Navigator.pushNamed(context, 'TestDialogPage');
        break;
      case 5:
        // BottomSheet
        BGBottomSheet.showGlobalBottomSheet(
          context: context, 
          listData: entries,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.book), // 左边Icon
              title: Text('Entry ${entries[index]}'), // 主标题
              trailing: Icon(Icons.arrow_right), // 右边Icon
            );
          }
        );
        break;
      default:
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
