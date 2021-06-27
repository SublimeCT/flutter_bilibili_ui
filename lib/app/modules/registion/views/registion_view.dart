import 'package:bilibili/app/routes/app_pages.dart';
import 'package:bilibili/widgets/login_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registion_controller.dart';

class RegistionView extends GetView<RegistionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // `@diff` 这里的 `AppBar` 并没有进行封装, 感觉没有必要
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text('登录'))
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Obx(() {
                String imageSuffix =
                    controller.passwordFocus.value ? 'password' : 'account';
                return Image.asset(
                    'assets/images/login_logo_${imageSuffix}.png');
              }),
            ),
            LoginInput(
              title: '用户名',
              hint: '请输入手机号码 / 邮箱',
              onChanged: (val) => controller.username.value = val,
            ),
            LoginInput(
              title: '密码',
              hint: '请输入密码',
              obscureText: true,
              keboardType: TextInputType.visiblePassword,
              onChanged: (val) => controller.password.value = val,
              focusChange: (isFocus) =>
                  controller.passwordFocus.value = isFocus,
            ),
            LoginInput(
              title: '确认密码',
              hint: '请再次输入密码',
              obscureText: true,
              keboardType: TextInputType.visiblePassword,
              onChanged: (val) => controller.confirmPassword.value = val,
              focusChange: (isFocus) =>
                  controller.passwordFocus.value = isFocus,
            ),
            LoginInput(
              title: '慕课网ID',
              hint: '请输入你的慕课网用户ID',
              onChanged: (val) => controller.imoocID.value = val,
            ),
            LoginInput(
              title: '慕课订单号',
              lineStreth: true,
              hint: '请输入订单号后四位',
              onChanged: (val) => controller.imoocOrderID.value = val,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  Get.snackbar('tips', '登录成功');
                },
                child: Text(
                  '注册',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Get.theme.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
