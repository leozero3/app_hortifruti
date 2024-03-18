import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/modules/user_address_list/user_address_list_repository.dart';
import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressListController extends GetxController
    with StateMixin<List<AddressModel>> {
  final UserAddressListRepository _repository;

  UserAddressListController(this._repository);

  @override
  void onInit() {
    fetchAddresses();
    super.onInit();
  }

  Future<void> fetchAddresses() {
    return _repository.getUserAddresses().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<void> goToNewAddress() async {
    var result = await Get.toNamed(Routes.userAddress);

    if (result is bool && result) {
      fetchAddresses();
    }
  }

  // delete the user address
  Future<void> deleteAddress(AddressModel address) async {
    _repository.deleteAddress(address.id).then(
      (value) async {
        await fetchAddresses();
        ScaffoldMessenger.of(Get.overlayContext!)
            .showSnackBar(SnackBar(content: Text('O endereço foi excluido')));
      },
      onError: (error) => Get.dialog(AlertDialog(
        title: Text(error.toString()),
      )),
    );
  }
}
