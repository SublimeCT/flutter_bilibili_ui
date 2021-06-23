import 'package:bilibili/pages/index.dart';
import 'package:bilibili/pages/login.dart';
import 'package:bilibili/pages/registion.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => IndexPage()),
  GetPage(name: '/registion', page: () => RegistionPage()),
  GetPage(name: '/login', page: () => LoginPage()),
];
