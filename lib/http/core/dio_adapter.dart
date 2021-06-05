import 'package:bilibili/http/core/hi_adapter.dart';
import 'package:bilibili/http/core/hi_error.dart';
import 'package:bilibili/http/request/base_request.dart';
import 'package:dio/dio.dart';

class DioAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) async {
    var response,
        option = BaseOptions(
          method: request.httpMethod().toString(),
          headers: request.headers,
        );
    var error;
    try {
      response = await Dio(option)
          .fetch(RequestOptions(path: request.url(), data: request.params));
    } on DioError catch (e) {
      error = e;
      response = e.response ?? HiNetResponse();
      print(response.toString());
    }
    if (error != null || response == null) {
      throw HiNetError(response.statusCode ?? -1, error.toString());
    }
    return buildRes(response, request);
  }

  /// 构建 HiNetResponse
  HiNetResponse buildRes(Response response, BaseRequest request) {
    return HiNetResponse(
      data: response.data,
      request: request,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response,
    );
  }
}
