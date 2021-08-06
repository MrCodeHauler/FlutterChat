
import 'package:flutter/material.dart';

/**
 * 紫色区域是字体的行高 即参数height 其效果值是 fontSize 的倍数
 * 当 height 为空时，行高默认是使用字体的量度
 * 当 height 不是空时，行高为 height * fontSize 的大小
 * 
 * StrutStyle
 * 
 * leading 默认为 null ，同时它的效果也是 fontSize 的倍数，并且分布是上下均分
 */

class TextDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Container(
          height: 200,
          color: Colors.yellow,
          alignment: Alignment.center,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.purple,
                child: new Text(
                  "Hg",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    textBaseline: TextBaseline.ideographic,
                    fontSize: 100,
                    height: 2
                  ),
                  strutStyle: StrutStyle(
                    forceStrutHeight: true,
                    fontSize: 100,
                    height: 1,
                    leading: 1
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}