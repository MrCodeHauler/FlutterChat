import 'package:flutter/material.dart';

class SeparatorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget blueDivider = Divider(color: Colors.blue);
    Widget greenDivider = Divider(color: Colors.green);
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? blueDivider : greenDivider;
      },
      itemCount: 100,
    );
  }
}
