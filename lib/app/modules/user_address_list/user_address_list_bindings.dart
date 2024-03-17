import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/user_address_list/user_address_list_repository.dart';
import 'package:get/get.dart';
import './user_address_list_controller.dart';

class UserAddressListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressListController>(
      () => UserAddressListController(
        UserAddressListRepository(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
