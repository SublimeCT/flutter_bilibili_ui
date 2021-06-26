import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  RxString username = ''.obs;
  RxString password = ''.obs;
  RxBool passwordFocus = false.obs;
  final passwordFocusNode = Rx<FocusNode>(new FocusNode());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    passwordFocusNode.value.addListener(() {
      passwordFocus.value = passwordFocusNode.value.hasFocus == true;
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
