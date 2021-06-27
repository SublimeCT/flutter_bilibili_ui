import 'package:bilibili/app/routes/app_pages.dart';
import 'package:bilibili/widgets/login_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTION);
              },
              child: Text('注册'))
        ],
      ),
      body: Scrollable(
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return Column(
            children: [
              Container(
                child: Obx(() {
                  String imageSuffix =
                      controller.passwordFocus.value ? 'password' : 'account';
                  return Image.asset(
                      'assets/images/login_logo_${imageSuffix}.png');
                }),
              ),
              // Form(
              //   onWillPop: () async => false,
              // ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: '手机号码 / 邮箱',
                  prefixIcon: Icon(Icons.person),
                  // focusedBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Get.theme.primaryColor)),
                ),
                maxLength: 16,
              ),
              TextField(
                focusNode: controller.passwordFocusNode.value,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: '密码',
                  prefixIcon: Icon(Icons.person),
                ),
                obscureText: true,
                maxLength: 16,
              ),
              Obx(() => Text(controller.username.value)),
              LoginInput(
                title: '用户名',
                hint: '手机号码 / 邮箱',
                onChanged: (val) {
                  controller.username.value = val;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
