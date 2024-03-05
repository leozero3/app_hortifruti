import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/data/models/payment_method_model.dart';
import 'package:app_hortifruti/app/data/models/shipping_by_city_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_service.dart';
import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_repository.dart';
import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final CheckoutRepository _repository;
  final _cartService = Get.find<CartService>();
  final _authService = Get.find<AuthService>();

  CheckoutController(this._repository);

  @override
  void onInit() {
    fetchAddresses();
    super.onInit();
  }

  final paymentMethod = Rxn<PaymentMethodModel>();
  final addresses = RxList<AddressModel>();

  num get totalOrder => totalCart + deliveryCost;
  bool get isLogged => _authService.isLogged;
  List<PaymentMethodModel> get paymentMethods =>
      _cartService.store.value!.paymentMethods;
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

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  void goToLogin() {
    Get.toNamed(Routes.login);
  }

  fetchAddresses() {
    _repository.getUserAddresses().then(
          (value) => addresses.addAll(value),
        );
  }
}
