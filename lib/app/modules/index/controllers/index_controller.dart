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
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
