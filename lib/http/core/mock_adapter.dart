import 'package:bilibili/http/core/hi_adapter.dart';
import 'package:bilibili/http/request/base_request.dart';

/// 测试适配器, mock 数据
class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse<T>>.delayed(Duration(seconds: 2), () {
      final res = {
        'code': 0,
        'message': 'success',
      };
      return HiNetResponse<T>(res as T, statusCode: 200);
    });
  }
}
