import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HttpClient {
  static Dio _dio = Dio();

  static Future<T> _request<T>(String path,
      {String? method,
      Map<String, dynamic>? params,
      data,
      CancelToken? cancelToken}) async {
    try {
      Response response = await _dio.request(path,
          data: data,
          queryParameters: params,
          options: Options(
            method: method,
          ),
          cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      LogUtil.v(_dioError(e), tag: '请求异常');
      EasyLoading.showInfo(_dioError(e));
      throw e;
    } catch (e) {
      throw e;
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
      default:
        return "网络异常，请稍后重试！";
    }
  }

  static Future<T> get<T>(String path,
      {Map<String, dynamic>? params, CancelToken? cancelToken}) {
    return _request(path,
        method: 'get', params: params, cancelToken: cancelToken);
  }

  static Future<T> post<T>(String path,
      {Map<String, dynamic>? params, data, CancelToken? cancelToken}) {
    return _request(path,
        method: 'post', params: params, data: data, cancelToken: cancelToken);
  }
}
