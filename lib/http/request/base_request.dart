import 'package:bilibili/http/dao/login_dao.dart';

enum HttpMethod {
  GET,
  POST,
  DELETE,
}

/// 基础请求类
/// url example:
/// `curl -X GET "http://api.devio.org/uapi/test/test?requestParams=hello" -H "accept: */*"`
/// 组成部分:
/// - path: /uapi/test/test
/// - useHttps: false
/// - pathParams: `foo/:bar` 中的 `/:bar` 部分
abstract class BaseRequest {
  /// `foo/:bar` 中的 `/:bar` 部分
  String pathParams = '';

  /// 是否启用 https
  bool useHttps = false;

  /// 域名
  String authority() => "localhost:3000";
  // String authority() => "api.devio.org";

  /// 请求方法
  HttpMethod httpMethod();

  /// method
  String get $method => httpMethod().toString().split('.')[1];

  /// path 部分
  String path();

  /// 是否需要登录
  bool needLogin();

  /// 最终的请求 URL
  String url() {
    String _path = path();
    if (pathParams != null) {
      _path = _path.endsWith("/") ? (_path + pathParams) : ("/" + pathParams);
    }
    Uri uri = useHttps
        ? Uri.https(authority(), _path, params)
        : Uri.http(authority(), _path, params);
    // 为需要登录的接口携带登录令牌
    if (needLogin()) {
      addHeader(LoginDao.BOARDING_PASS, LoginDao.getBoardingPass());
    }
    return uri.toString();
  }

  /// `query` 部分
  Map<String, String> params = Map();

  /// 添加 `query` 参数
  BaseRequest add(String key, Object value) {
    params[key] = value.toString();
    return this;
  }

  /// 添加多个 `query` 参数
  BaseRequest addQueries(Map<String, Object> queries) {
    print('add quyeries:' + queries.toString());
    queries.forEach((key, value) {
      // value;
      // print('蛤: ' + key + '?' + value);
      if (key != null && value != null) params[key] = value.toString();
    });
    return this;
  }

  /// `header` 参数
  Map<String, String> headers = Map();

  /// 添加 `header` 参数
  BaseRequest addHeader(String key, Object value) {
    headers[key] = value.toString();
    return this;
  }
}
