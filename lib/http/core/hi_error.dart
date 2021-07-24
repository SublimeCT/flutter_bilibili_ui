/// 需要授权的异常
class NeedAuth extends HiNetError {
  NeedAuth(String message, {int code: 403, dynamic data})
      : super(code, message, data: data);
}

/// 需要登录的异常
class NeedLogin extends HiNetError {
  NeedLogin({int code: 401, String message: '请先登录'}) : super(code, message);
}

/// 网络异常基类
class HiNetError implements Exception {
  final int code;
  final String message;
  final dynamic data;

  HiNetError(this.code, this.message, {this.data});
}

/// 未初始化异常
class NoInit extends HiInternalError<String> {
  NoInit({String message: '未初始化', String details: '', String? tag})
      : super(10001, message, details, tag);
}

/// 内部错误异常基类
class HiInternalError<E> implements Exception {
  final int code;
  final String? tag;
  final String message;
  final E data;

  HiInternalError(
    this.code,
    this.message,
    this.data, [
    this.tag,
  ]);
}
