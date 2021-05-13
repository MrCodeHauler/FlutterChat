import 'package:flutter/material.dart';
import 'package:hello_world/flipCard/bgFlipCard.dart';

class MiniGameCard extends StatelessWidget {

  final String item;
  final FlipDirection direction;  // 旋转方向
  final BoxDecoration? decoration; // 背景颜色
  final bool enabledFlip; // 是否支持旋转

  const MiniGameCard({
    Key? key,
    this.item = '',
    this.decoration,
    this.direction = FlipDirection.Horizontal,
    this.enabledFlip = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    if (enabledFlip) {
      return buildBGFlipCard();
    } else {
      return buildBGCard();
    }
  }

  Widget buildBGCard() {
    return Container(
      key: Key(item.toString()),
      width: 100,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: decoration,
      child: Center(
        child: Text(
          item.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        )
      )
    );
  }

  Widget buildBGFlipCard() {
    return BGFlipCard(
      direction: direction,
      front: Container(
        key: Key(item.toString()),
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: decoration,
      ),
      back: Container(
        key: Key(item.toString()),
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: decoration,
        child: Center(
          child: Text(
            item.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )
        )
      ),
    );
  }
}
