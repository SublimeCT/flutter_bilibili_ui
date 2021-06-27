import 'package:get/get.dart';

class RegistionController extends GetxController {
  //TODO: Implement LoginController

  RxString username = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString imoocID = ''.obs;
  RxString imoocOrderID = ''.obs;
  RxBool passwordFocus = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
