import 'package:flutter/material.dart';
import 'package:hello_world/common/bgListView.dart';

class MiniGame extends StatefulWidget {
  MiniGame({Key? key}): super(key: key);

  @override
  _MiniGameState createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  final List<int> _items = List<int>.generate(5, (int index) => index);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('牌杀小游戏')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('预设五张牌的顺序，与对手进行竞猜，如果对应顺序的牌大于对方，则计1，如果总计数大于对方则赢，如果小于则输，相等为平',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('对方的顺序',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 600,
            height: 100,
            child: BGListView(
              scrollDirection: Axis.horizontal,
              listData: _items,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  key: Key(index.toString()),
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(10)
                  ),
                );
              }
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('拖动进行顺序设定',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: SizedBox(
              width: 600,
              height: 100,
              child: ReorderableListView(
                scrollDirection: Axis.horizontal,
                children: _items.map((item) => Container(
                  key: Key(item.toString()),
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.primaries[item % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(10)
                  ),
                )).toList(),
                onReorder: (int oldIndex, int newIndex) { // 拖动完成的回调 (旧的索引，新的索引)
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final int item = _items.removeAt(oldIndex);
                    _items.insert(newIndex, item);
                  });
                }
              )
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('设定竞猜金额(TRX)',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )
    );
  }
}