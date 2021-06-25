import 'package:get/get.dart';

import 'package:bilibili/app/modules/home/bindings/home_binding.dart';
import 'package:bilibili/app/modules/home/views/home_view.dart';
import 'package:bilibili/app/modules/index/bindings/index_binding.dart';
import 'package:bilibili/app/modules/index/bindings/index_binding.dart';
import 'package:bilibili/app/modules/index/views/index_view.dart';
import 'package:bilibili/app/modules/index/views/index_view.dart';
import 'package:bilibili/app/modules/login/bindings/login_binding.dart';
import 'package:bilibili/app/modules/login/views/login_view.dart';
import 'package:bilibili/app/modules/registion/bindings/registion_binding.dart';
import 'package:bilibili/app/modules/registion/views/registion_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INDEX;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTION,
      page: () => RegistionView(),
      binding: RegistionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.INDEX,
      page: () => IndexView(),
      binding: IndexBinding(),
    ),
  ];
}
