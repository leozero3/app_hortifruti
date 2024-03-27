import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/modules/select_city/select_city_repository.dart';
import 'package:get/get.dart';

class SelectCityController extends GetxController
    with StateMixin<List<CityModel>> {
  final SelectCityRepository _repository;
  SelectCityController(this._repository);

  @override
  void onInit() {
    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
    super.onInit();
  }
}
