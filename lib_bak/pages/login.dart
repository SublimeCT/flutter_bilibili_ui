import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
      ),
      body: Container(
        child: TextButton(
          child: Text('to Registion'),
          onPressed: () {
            Get.toNamed('/registion');
          },
        ),
      ),
    );
  }
}
