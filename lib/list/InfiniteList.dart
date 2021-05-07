// import 'package:flutter/material.dart';

// class InfiniteList extends StatefulWidget {

// }

// class _InfiniteListState extends State<InfiniteList> {
//   static const loadingTag = "##loading##"; // 表尾标记
//   var _words = <String>[loadingTag];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemBuilder: (context, index) {
//         if (_words[index] == loadingTag) {
//           // 到了表尾
//           if (_words.length - 1 < 100) {
//             // 不足100条，继续获取数据
//             // 获取数据

//           }
//         } else {
//           // 已经加载了100条数据，不再获取数据
//           return Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(16.0),
//             child: Text('没有更多了', style: TextStyle(color: Colors.grey)),
//           );
//         }
//       },
//       separatorBuilder: null,
//       itemCount: _words.length
//     );
//   }

//   void _retrieveData() {

//   }
// }
