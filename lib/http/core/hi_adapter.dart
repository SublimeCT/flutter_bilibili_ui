import 'dart:convert';

import 'package:bilibili/http/request/base_request.dart';
import 'package:flutter/cupertino.dart';

/// 网络请求抽象类
abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}

/// 统一网络层返回数据式格
class HiNetResponse<T> {
  HiNetResponse(
    this.data, {
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  T data;
  BaseRequest? request;
  int? statusCode;
  String? statusMessage;
  dynamic? extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    } else {
      return data.toString();
    }
  }
}
