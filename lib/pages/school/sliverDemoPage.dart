import 'package:flutter/material.dart';

class SliverDemoPage extends StatelessWidget {
  // 列表项
  Widget _buildListItem(BuildContext context, int index) {
    return ListTile(title: Text('list tile index $index'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              color: Colors.green,
              child: Text('HeaderView'),
            ),
          ),
          // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
          SliverList(
            delegate:
                SliverChildBuilderDelegate(_buildListItem, childCount: 30),
          )
        ],
      ),
    );
  }
}
