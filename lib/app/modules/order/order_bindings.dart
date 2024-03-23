import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/order/order_repository.dart';
import 'package:get/get.dart';
import './order_controller.dart';

class OrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
        () => OrderController(OrderRepository(Get.find<Api>())));
  }
}
