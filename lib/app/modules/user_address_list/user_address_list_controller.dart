import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/modules/user_address_list/user_address_list_repository.dart';
import 'package:get/get.dart';

class UserAddressListController extends GetxController
    with StateMixin<List<AddressModel>> {
  final UserAddressListRepository _repository;

  UserAddressListController(this._repository);

  @override
  void onInit() {
    _repository.getUserAddresses().then((data) {
      change(data, status: RxStatus.success());
    });
    super.onInit();
  }
}
