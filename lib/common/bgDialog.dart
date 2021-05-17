import 'package:flutter/material.dart';

// 参考：https://blog.csdn.net/weixin_33812433/article/details/91418996

class BGDialog {
  static void showGlobalDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false, // 半透明背景
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("标题"),
          content: Text("内容"),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                // print('取消');
                Navigator.pop(context)
              },
              child: Text('取消')
            ),
            TextButton(
              onPressed: () => {
                print('确定')
              },
              child: Text('确定')
            )
          ],
        );
      }
    );
  }
}