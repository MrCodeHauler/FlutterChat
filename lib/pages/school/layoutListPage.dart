import 'package:flutter/material.dart';
import 'package:hello_world/common/bgListView.dart';

class LayoutListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LayoutListPageState();
}

class _LayoutListPageState extends State<LayoutListPage> {

  final List<String> entries = <String>[
    'Center Layout',
    'Padding Layout',
    'Align Layout'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout")),
      body: BGListView(
        listData: entries,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.book), // 左边Icon
            title: Text('Entry ${entries[index]}'), // 主标题
            trailing: Icon(Icons.arrow_right), // 右边Icon
          );
        },
        didClickItem: didClickItem,
      ),
    );
  }

  void didClickItem(int index) {
    switch (index) {
      case 0:
        // 居中布局
        Navigator.pushNamed(context, 'CenterLayoutDemo');
        break;
      case 1:
        // Padding布局
        Navigator.pushNamed(context, 'PaddingLayoutPage');
        break;
      case 2:
        // 对齐布局
        Navigator.pushNamed(context, 'AlignLayoutDemo');
        break;
    }
  }
}
