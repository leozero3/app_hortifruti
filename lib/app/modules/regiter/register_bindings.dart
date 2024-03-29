import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/regiter/register_controller.dart';
import 'package:app_hortifruti/app/modules/regiter/register_repository.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(RegisterRepository(Get.find<Api>())));
  }
}
