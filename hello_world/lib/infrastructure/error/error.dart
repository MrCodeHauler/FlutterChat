import 'package:flutter/foundation.dart';

void collectLog(String line) {
  print('收集日志：$line');
  // 收集日志
}

void reportErrorAndLog(FlutterErrorDetails details) {
  // 上报错误和日志逻辑
  print('上报错误和日志逻辑：$details');
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  // 构建错误日志
  return FlutterErrorDetails();
}