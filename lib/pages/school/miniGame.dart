import 'package:flutter/material.dart';

class MiniGame extends StatefulWidget {
  MiniGame({Key? key}): super(key: key);

  @override
  _MiniGameState createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
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
          
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('拖动进行顺序设定',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
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