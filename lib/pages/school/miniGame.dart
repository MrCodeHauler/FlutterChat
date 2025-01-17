import 'package:flutter/material.dart';
import 'package:hello_world/common/bgListView.dart';
import 'package:hello_world/common/bgSlider.dart';
import 'package:hello_world/views/school/cardItem.dart';

class MiniGame extends StatefulWidget {
  final Map? arguments;

  MiniGame({Key? key, this.arguments}) : super(key: key);

  @override
  _MiniGameState createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  List<int> _items = List<int>.generate(2, (int index) => index);

  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments;
    print("$arg");

    int cardwidth = 100;
    List shuffleItems = this.shuffleList(_items);

    return Scaffold(
        appBar: AppBar(title: Text('牌杀小游戏')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 600,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            '预设两张牌的顺序，与对手进行竞猜，如果对应顺序的牌大于对方，则计1，如果总计数大于对方则赢，如果小于则输，相等为平',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            '对方的顺序',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                            width:
                                ((cardwidth + 20) * _items.length).toDouble(),
                            height: 100,
                            child: BGListView(
                                scrollDirection: Axis.horizontal,
                                listData: shuffleItems,
                                itemBuilder: (BuildContext context, int index) {
                                  return MiniGameCard(
                                    enabledFlip: true,
                                    key: Key(index.toString()),
                                    item: shuffleItems[index].toString(),
                                    decoration: BoxDecoration(
                                        color: Colors.primaries[
                                            index % Colors.primaries.length],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  );
                                })),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            '拖动进行顺序设定',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                            child: SizedBox(
                                width: ((cardwidth + 20) * _items.length)
                                    .toDouble(),
                                height: 100,
                                child: ReorderableListView(
                                    scrollDirection: Axis.horizontal,
                                    children: _items
                                        .map((item) => MiniGameCard(
                                              key: Key(item.toString()),
                                              item: item.toString(),
                                              decoration: BoxDecoration(
                                                  color: Colors.primaries[item %
                                                      Colors.primaries.length],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ))
                                        .toList(),
                                    onReorder: (int oldIndex, int newIndex) {
                                      // 拖动完成的回调 (旧的索引，新的索引)
                                      setState(() {
                                        if (oldIndex < newIndex) {
                                          newIndex -= 1;
                                        }
                                        final int item =
                                            _items.removeAt(oldIndex);
                                        _items.insert(newIndex, item);
                                      });
                                    }))),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            '设定竞猜金额(TRX)',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        BGSlider(
                            value: _currentSliderValue,
                            minValue: 1,
                            maxValue: 100,
                            divisions: 100,
                            label: _currentSliderValue.round().toString(),
                            activeColor: Colors.blue,
                            inactiveColor: Colors.red,
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            }),
                      ],
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    child: Text('参与小游戏'),
                    onPressed: () {
                      print('游戏结果');
                    },
                  ),
                ))
          ],
        )));
  }

  List<dynamic> shuffleList(List<dynamic> list) {
    List newList = [];
    newList.addAll(list);
    newList.shuffle();
    return newList;
  }
}
