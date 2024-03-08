import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_service.dart';
import 'package:app_hortifruti/app/modules/user_address/user_address_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController
    with StateMixin<List<CityModel>> {
  final UserAddressRepository _repository;

  UserAddressController(this._repository);

  final _authService = Get.find<AuthService>();
  final streetController = TextEditingController(text: 'rua abc');
  final numberController = TextEditingController(text: '10');
  final neighborhoodController = TextEditingController(text: 'jd primavera');
  final referenceController = TextEditingController(text: 'mercadinho');
  final complementController = TextEditingController(text: '');

  @override
  void onInit() {
    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
    super.onInit();
  }

  void submit() {}
}
