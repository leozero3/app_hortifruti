import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/select_city/select_city_repository.dart';
import 'package:get/get.dart';
import './select_city_controller.dart';

class SelectCityBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCityController>(() =>
        SelectCityController(Get.put(SelectCityRepository(Get.find<Api>()))));
  }
}
