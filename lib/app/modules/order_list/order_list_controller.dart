import 'package:app_hortifruti/app/data/models/order_model.dart';
import 'package:app_hortifruti/app/modules/order_list/order_list_repository.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController
    with StateMixin<List<OrderModel>> {
  final OrderListRepository _repository;

  OrderListController(this._repository);

  @override
  void onInit() {
    _repository.getOrders().then((data) {
      var status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
    super.onInit();
  }
}
