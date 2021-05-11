import 'package:flutter/material.dart';

typedef BGSliderFunction = void Function(double);

class BGSlider extends StatelessWidget {
  final double value; // 初始值
  final double minValue; // 最小值
  final double maxValue; // 最大值
  final Color? activeColor; // 滑动过的区域的颜色
  final Color? inactiveColor; // 未滑动过的区域的颜色
  final String? label; // divisions设置显示在节点上的label
  final int? divisions; // 分为几块，比如设置为5，Slider只能滑动到5个位置
  final BGSliderFunction? onChanged; // 变化时回调
  final BGSliderFunction? onChangeStart; // 滑动开始时回调一次
  final BGSliderFunction? onChangeEnd; // 滑动结束时回调一次

  const BGSlider({
    required this.value,
    this.minValue = 0.0,
    this.maxValue = 1.0,
    this.activeColor,
    this.inactiveColor,
    this.label,
    this.divisions,
    this.onChanged,
    this.onChangeEnd,
    this.onChangeStart
  }): super();

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: minValue,
      max: maxValue,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      divisions: divisions,
      label: label,
      onChanged: onChanged,
      onChangeEnd: onChangeEnd,
      onChangeStart: onChangeStart,
    );
  }
}
