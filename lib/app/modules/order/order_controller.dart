import 'package:app_hortifruti/app/data/models/order_model.dart';
import 'package:app_hortifruti/app/modules/order/order_repository.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin<OrderModel> {
  final OrderRepository _repository;

  OrderController(this._repository);

  @override
  void onInit() {
    String id = Get.parameters['id']!;
    _repository.getOrder(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
    super.onInit();
  }
}
