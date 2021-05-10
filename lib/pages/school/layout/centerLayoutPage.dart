import 'package:flutter/material.dart';

/**
 * 如果它的尺寸受到约束且[widthFactor]和[heightFactor]为空，则此窗口小部件将尽可能大
 * 如果维度不受约束且相应的大小因子为null，则窗口小部件将匹配其在该维度中的子项大小（其实就是子view的宽高就是center容器的宽高）
 * 如果尺寸因子为非null，则此center容器的相应尺寸将是子view的尺寸和尺寸因子的乘积
 * 例如，如果widthFactor是2.0，那么此小部件的宽度将始终是其子宽度的两倍，并且将子view居中
 */

class CenterLayoutDemo extends StatelessWidget {
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
