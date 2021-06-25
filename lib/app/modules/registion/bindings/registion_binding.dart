import 'package:get/get.dart';

import '../controllers/registion_controller.dart';

class RegistionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistionController>(
      () => RegistionController(),
    );
  }
}
