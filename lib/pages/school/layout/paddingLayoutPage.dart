import 'package:flutter/material.dart';

/**
 * Padding 即为填充组件，用于处理容器与其子元素之间的间距
 */

class PaddingLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("CenterLayoutDemo")),
      body: Container(
        child: Center(
          widthFactor: 2.0, // 宽度因子，Center组件的宽度等于子组件宽度 * 宽度因子
          heightFactor: 3.0, // 高度因子，Center组件的高度等于子组件高度 * 高度因子
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.red,
            )
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.blue,
          )
      )
    );
  }
}
