import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:app_hortifruti/app/data/services/storage/storage_service.dart';
import 'package:app_hortifruti/app/modules/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<StoreModel>> {
  HomeRepository _repository;
  HomeController(this._repository);

  @override
  void onInit() {
    int cityId = Get.find<StorageService>().cityId!;
    _repository.getStores(cityId).then(
      (data) {
        if (data.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      },
      onError: (error) => change(
        null,
        status: RxStatus.error(error.toString()),
      ),
    );
    super.onInit();
  }
}
