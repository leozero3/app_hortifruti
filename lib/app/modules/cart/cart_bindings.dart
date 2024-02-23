import 'package:get/get.dart';
import './cart_controller.dart';

class CartBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
