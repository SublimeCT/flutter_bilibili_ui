import 'package:bilibili/db/hi_cache.dart';
import 'package:bilibili/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (GetPlatform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
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
            theme: AppThemes.light,
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
