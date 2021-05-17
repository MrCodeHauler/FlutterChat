import 'package:flutter/material.dart';
import 'package:hello_world/common/bgListView.dart';


//   底部多项选择弹窗
//   maxHeight: 内容区域的最大高度默认为 constraints.maxHeight * 9.0 / 16.0, 可通过isScrollControlled以及itemBuilder来自定义
//   shape: 定义边框形状, 如定义为 => 左上右上均为圆角
//   RoundedRectangleBorder(
//     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//     side: BorderSide(
//       width: 2,
//       color: Colors.blue,
//       style: BorderStyle.solid
//     )
//   )


typedef BGOnClickSheetFunction = void Function(int);
typedef BGSheetItemBuilder = Widget Function(BuildContext, int);

class BGBottomSheet {
  static showGlobalBottomSheet({
    required BuildContext context,
    required List<dynamic> listData,
    required BGSheetItemBuilder itemBuilder,
    bool enableDrag = true, // 是否支持拖拽消失
    bool isDismissible = true, // 是否支持点击空白消失
    Color? barrierColor, // 蒙层背景颜色
    Color? backgroundColor, // 内容区域背景颜色
    double? elevation, // 下影值
    ShapeBorder? shape,
    BGOnClickSheetFunction? onClickSheet,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: enableDrag,
      barrierColor: barrierColor,
      elevation: elevation,
      backgroundColor: backgroundColor,
      shape: shape,
      isDismissible: isDismissible,
      builder: (BuildContext context) {
        return Padding(
          child: BGListView(
            listData: listData,
            didClickItem: onClickSheet,
            itemBuilder: itemBuilder
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
        );
      }
    );
  }
}
