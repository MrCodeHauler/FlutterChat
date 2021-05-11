import 'package:flutter/material.dart';

/**
 * Padding 即为填充组件，用于处理容器与其子元素之间的间距
 */

class AlignLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("AlignLayoutDemo")),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(0.5, 0.5), // 
            child: Image.asset(
              'images/1.jpg',
              width: 120,
              height: 120,
            ),
          ),
          Align(
            alignment: FractionalOffset(0, 0),
            child: Image.asset(
              'images/2.jpg',
              width: 120,
              height: 120,
            ),
          ),
          Align(
            alignment: FractionalOffset.topRight,
            child: Image.asset(
              'images/3.jpg',
              width: 120,
              height: 120,
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomLeft,
            child: Image.asset(
              'images/4.png',
              width: 120,
              height: 120,
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomRight,
            child: Image.asset(
              'images/1.jpg',
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
