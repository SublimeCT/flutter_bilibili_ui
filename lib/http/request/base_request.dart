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
  String pathParams;

  /// 是否启用 https
  bool useHttps = true;

  /// 域名
  String authority() => "api.devio.org";

  /// 请求方法
  HttpMethod httpMethod();

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
    return uri.toString();
  }

  /// `query` 部分
  Map<String, String> params = Map();

  /// 添加 `query` 参数
  BaseRequest add(String key, Object value) {
    params[key] = value.toString();
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
