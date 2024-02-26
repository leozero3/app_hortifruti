import 'package:app_hortifruti/app/data/models/payment_method_model.dart';
import 'package:app_hortifruti/app/data/models/shipping_by_city_model.dart';
import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_repository.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final _cartService = Get.find<CartService>();
  final CheckoutRepository _repository;
  CheckoutController(this._repository);

  num get totalCart => _cartService.total;
  num get deliveryCost {
    if (getShippingByCity != null) {
      return getShippingByCity!.cost;
    }
    return 0;
  }

  ShippingByCityModel? get getShippingByCity {
    var cityId = 1;
    return _cartService.store.value!.shippingByCity
        .firstWhereOrNull((shippingByCity) => shippingByCity.id == cityId);
  }

  num get totalOrder => totalCart + deliveryCost;

  List<PaymentMethodModel> get paymentMethods =>
      _cartService.store.value!.paymentMethods;

  final paymentMethod = Rxn<PaymentMethodModel>();

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }
}
