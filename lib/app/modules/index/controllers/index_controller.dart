import 'package:bilibili/app/routes/app_pages.dart';
import 'package:bilibili/db/hi_cache.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  //TODO: Implement IndexController

  final count = 0.obs;
  RxString token = ''.obs;
  @override
  void onInit() {
    final db = HiCache.getInstance();
    token.value = db.getString('token');
    super.onInit();
  }

  @override
  void onReady() {
    checkLogin();
    super.onReady();
  }

  checkLogin() {
    print('若不存在 token 则跳转到登录页: ${token == ''}');
    // 若不存在 token 则跳转到登录页, 并移除之前的全部 `history`
    if (token == '') Get.offNamed(Routes.LOGIN);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
