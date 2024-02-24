import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_repository.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final _cartService = Get.find<CartService>();
  final CheckoutRepository _repository;
  CheckoutController(this._repository);

  num get totalCart => _cartService.total;
  num get deliveryCost => 0;
  num get totalOrder => totalCart + deliveryCost;
}
