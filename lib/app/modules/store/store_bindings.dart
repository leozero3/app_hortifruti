import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/store/store_controller.dart';
import 'package:app_hortifruti/app/modules/store/store_repository.dart';
import 'package:get/get.dart';

class StoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(StoreRepository(Get.find<Api>())),
    );
  }
}
