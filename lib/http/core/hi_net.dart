import 'package:bilibili/http/core/hi_adapter.dart';
import 'package:bilibili/http/core/hi_error.dart';
import 'package:bilibili/http/core/mock_adapter.dart';
import 'package:bilibili/http/request/base_request.dart';

import 'dio_adapter.dart';

class HiNet {
  HiNet._();
  static HiNet _instance;
  static HiNet getInstance() =>
      _instance == null ? (_instance = new HiNet._()) : _instance;

  Future fire(BaseRequest request) async {
    HiNetResponse response = new HiNetResponse();
    dynamic error;
    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      printLog("///////////////////");
      // printLog(e.message);
    } catch (e) {
      error = e;
      printLog(e);
    }

    if (response == null) {
      response = HiNetResponse();
    } else if (response.data == null) {
      printLog(error);
    }
    var result = response?.data;
    print(result);
    var status = response.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw HiNetError(status, result.toString(), data: result);
    }
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    print('url: ${request.url()}');
    // HiNetAdapter adapter = MockAdapter();
    HiNetAdapter adapter = DioAdapter();
    return await adapter.send(request);
  }

  void printLog(log) {
    print('hi_net: ${log.toString()}');
  }
}
