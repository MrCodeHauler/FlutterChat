/// Flutter code sample for ReorderableListView

import 'package:flutter/material.dart';
class TestReorderableListView extends StatefulWidget {
  const TestReorderableListView({Key? key}) : super(key: key);

  @override
  _TestReorderableListViewState createState() => _TestReorderableListViewState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TestReorderableListViewState extends State<TestReorderableListView> {
  final List<int> _items = List<int>.generate(20, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestReorderableListView'),
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: _items.map((item) => Dismissible(
          key: Key(item.toString()),
          child: Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.primaries[item % Colors.primaries.length],
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              _items.removeAt(item);
            });

            // show a snackbar
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$item dismissed")));
          },
          background: Container(color: Colors.red),
        )).toList(),
        onReorder: (int oldIndex, int newIndex) { // 拖动完成的回调 (旧的索引，新的索引)
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

