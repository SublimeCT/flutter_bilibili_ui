import 'package:bilibili/db/hi_cache.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    MyApp(),
  );
}

Future<void> init() async {
  await HiCache.preInit();
}

final MyApp = () => FutureBuilder(
      future: init(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('connection state: ${snapshot.connectionState}');
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(),
              body: Container(
                child: Text('loading ...'),
              ),
            ),
          );
        }
      },
    );
