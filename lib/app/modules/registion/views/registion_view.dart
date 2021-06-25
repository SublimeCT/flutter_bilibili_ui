import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registion_controller.dart';

class RegistionView extends GetView<RegistionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegistionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegistionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
