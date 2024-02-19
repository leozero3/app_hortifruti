import 'dart:developer';

import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:app_hortifruti/app/modules/store/store_repository.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with StateMixin<StoreModel> {
  final StoreRepository _repository;
  StoreController(this._repository);

  @override
  void onInit() {
    int id = int.parse(Get.parameters['id']!);

    _repository.getStore(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      log(error.toString());
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}
