import 'package:bilibili/http/core/hi_adapter.dart';
import 'package:bilibili/http/request/base_request.dart';

/// 测试适配器, mock 数据
class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse>.delayed(Duration(seconds: 2), () {
      return HiNetResponse(data: {
        'code': 0,
        'message': 'success',
      }, statusCode: 200);
    });
  }
}
