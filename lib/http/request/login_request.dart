import 'package:bilibili/http/request/base_request.dart';

class LoginRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() => HttpMethod.POST;

  @override
  bool needLogin() => false;

  @override
  String path() => '/uapi/user/login';
}
