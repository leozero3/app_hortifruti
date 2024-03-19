import 'dart:ffi';

import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/data/models/user_address_request_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_service.dart';
import 'package:app_hortifruti/app/modules/user_address/user_address_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController
    with StateMixin<List<CityModel>> {
  final UserAddressRepository _repository;

  UserAddressController(this._repository);

  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();
  final streetController = TextEditingController(text: 'rua abc');
  final numberController = TextEditingController(text: '10');
  final neighborhoodController = TextEditingController(text: 'jd primavera');
  final referenceController = TextEditingController(text: 'mercadinho');
  final complementController = TextEditingController(text: '');
  final cityId = RxnInt();
  final _address = Rxn<AddressModel>();
  final editing = RxBool(false);

  @override
  void onInit() {
    if (Get.arguments != null) {
      editing(true);
      _address.value = Get.arguments;
      streetController.text = _address.value!.street;
      numberController.text = _address.value!.number;
      neighborhoodController.text = _address.value!.neighborhood;
      referenceController.text = _address.value!.referencePoint;
      complementController.text = _address.value!.complement ?? '';
      cityId.value = _address.value!.city!.id;
    }
    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
    super.onInit();
  }

  void submit() {
    Get.focusScope!.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    var userAddressRequest = UserAddressRequestModel(
      id: editing.isTrue ? _address.value!.id : null,
      street: streetController.text,
      number: numberController.text,
      neighborhood: neighborhoodController.text,
      referencePoint: referenceController.text,
      cityId: cityId.value!,
      complement: complementController.text,
    );

    if (editing.isTrue) {
      return _updateAddress(userAddressRequest);
    }
    _addAddress(userAddressRequest);
  }

  void _updateAddress(UserAddressRequestModel userAddressRequest) {
    _repository.putAddress(userAddressRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text('Endereço atualizado com sucesso!'),
        ),
      );
      Get.back(result: true);
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }

  void _addAddress(UserAddressRequestModel userAddressRequest) {
    _repository.postAddress(userAddressRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text('Endereço adicionado com sucesso!'),
        ),
      );
      Get.back(result: true);
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }

  void changeCity(int? cityIdSelected) {
    cityId.value = cityIdSelected;
  }
}
