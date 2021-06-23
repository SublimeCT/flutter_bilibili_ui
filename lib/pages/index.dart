import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello world'),
      ),
      body: Container(
        child: TextButton(
          child: Text('to Registion'),
          style: ButtonStyle(
              // backgroundColor: Colors.tealAccent;
              ),
          onPressed: () {
            Get.toNamed('/registion');
          },
        ),
      ),
    );
  }
}
