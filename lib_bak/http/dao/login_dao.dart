import 'package:bilibili/db/hi_cache.dart';
import 'package:bilibili/http/core/hi_net.dart';
import 'package:bilibili/http/request/base_request.dart';
import 'package:bilibili/http/request/login_request.dart';
import 'package:bilibili/http/request/registration_request.dart';

class LoginDao {
  /** 登录令牌, 签名算法和签名本项目已省略 */
  static const BOARDING_PASS = 'BOARDING_PASS';
  static login(String userName, String password) => _send(userName, password);
  static registration(
          String userName, String password, String imoocId, String orderId) =>
      _send(userName, password, imoocId: imoocId, orderId: orderId);

  static _send(String userName, String password,
      {String imoocId, String orderId}) async {
    final BaseRequest request = imoocId != null && orderId != null
        ? RegistrationRequest()
        : LoginRequest();
    request.addQueries({
      'userName': userName,
      'password': password,
      'imoocId': imoocId,
      'orderId': orderId,
    });
    var result = await HiNet.getInstance().fire(request);
    // print(result);
    return result;
    // 返回数据结构: { "code": 0, "data": {}, "extra": {}, "msg": "string" }
    // refer: https://api.devio.org/uapi/swagger-ui.html#/Account/registrationUsingPOST
    // await Future.delayed(Duration(milliseconds: 300));
    // return imoocId == null
    //     ? {
    //         'code': 0,
    //         'data': 'JIJIOQMIODMSIOPAKPOWMDOPAW',
    //         "extra": {},
    //         'msg': 'login success.'
    //       }
    //     : {"code": 0, "data": 'CIOA', "extra": {}, "msg": "registion success."};
  }

  static String getBoardingPass() => HiCache.getInstance().get(BOARDING_PASS);
}
