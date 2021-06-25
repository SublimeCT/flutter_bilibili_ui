import 'package:bilibili/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(
              'IndexView is working "${controller.token}"',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
