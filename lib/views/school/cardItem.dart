import 'package:flutter/material.dart';
import 'package:hello_world/flipCard/bgFlipCard.dart';

class MiniGameCard extends StatelessWidget {

  final int index;
  final item;

  const MiniGameCard(
    Key? key,
    this.index,
    this.item
  ): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BGFlipCard(
      direction: FlipDirection.Horizontal, // default
      front: Container(
        key: Key(item.toString()),
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.primaries[item % Colors.primaries.length],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            item.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )
        )
      ),
        back: Container(
          child: Text('Back'),
          decoration: BoxDecoration(color: Colors.lightBlue),
        ),
    );
  }
}