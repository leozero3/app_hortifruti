import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/user_address/user_address_controller.dart';
import 'package:app_hortifruti/app/modules/user_address/user_address_repository.dart';
import 'package:get/get.dart';

class UserAddressBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressController>(
      () => UserAddressController(
        UserAddressRepository(Get.find<Api>()),
      ),
    );
  }
}
