import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_repository.dart';
import 'package:get/get.dart';
import './checkout_controller.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
        () => CheckoutController(CheckoutRepository(Get.find<Api>())));
  }
}
