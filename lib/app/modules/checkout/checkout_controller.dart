import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/data/models/order_request_model.dart';
import 'package:app_hortifruti/app/data/models/payment_method_model.dart';
import 'package:app_hortifruti/app/data/models/shipping_by_city_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_service.dart';
import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_repository.dart';
import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final CheckoutRepository _repository;
  CheckoutController(this._repository);

  final _cartService = Get.find<CartService>();
  final _authService = Get.find<AuthService>();
  final paymentMethod = Rxn<PaymentMethodModel>();
  final addresses = RxList<AddressModel>();
  final addresseSelected = Rxn<AddressModel>();
  bool get deliveryToMyAddress => getShippingByCity != null;
  bool get canSendOrder => isLogged && deliveryToMyAddress;

  final loading = true.obs;

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

  @override
  void onInit() {
    fetchAddresses();

    ever(_authService.user, (_) => fetchAddresses());
    super.onInit();
  }

  ShippingByCityModel? get getShippingByCity {
    if (addresseSelected.value == null) {
      return null;
    }

    var cityId = 1;

    return _cartService.store.value!.shippingByCity.firstWhereOrNull(
        (shippingByCity) =>
            shippingByCity.id == addresseSelected.value!.city!.id);
  }

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  Future<void> goToNewAddress() async {
    var result = await Get.toNamed(Routes.userAddress);

    if (result is bool && result) {
      fetchAddresses();
    }
  }

  void goToLogin() {
    Get.toNamed(Routes.login);
  }

  void fetchAddresses() {
    loading(true);
    _repository.getUserAddresses().then((value) {
      addresses.assignAll(value);
      if (addresses.isNotEmpty) {
        addresseSelected.value = addresses.first;
      }
      loading.value = false;
    }, onError: (error) {
      loading.value = false;
    });
  }

  void showAddressList() {
    Get.dialog(SimpleDialog(
      title: const Text('Selecioner um endereço'),
      children: [
        for (var address in addresses)
          SimpleDialogOption(
            child: Text(
                '${address.street}, n° ${address.number}, n° ${address.neighborhood}'),
            onPressed: () {
              addresseSelected.value = address;
              Get.back();
            },
          ),
        TextButton(
            onPressed: () {
              Get.back();
              goToNewAddress();
            },
            child: const Text('Cadastrar um endereço'))
      ],
    ));
  }

  void sendOrder() {
    if (paymentMethod.value == null) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: const Text('Escolha uma forma de pagamento'),
        ),
      );
      return;
    }
    var orderRequest = OrderRequestModel(
      store: _cartService.store.value!,
      paymentMethod: paymentMethod.value!,
      cartProducts: _cartService.products,
      address: addresseSelected.value!,
      observation: _cartService.observation.value,
    );

    _repository.postOrder(orderRequest).then((value) {
      Get.dialog(
        AlertDialog(
          title: Text('Pedido enviado'),
          actions: [
            TextButton(
              onPressed: () {
                _cartService.finalizeCart();
                Get.offAllNamed(Routes.dashboard, arguments: 2);
              },
              child: Text('Ver Meus Pedidos'),
            )
          ],
        ),
        barrierDismissible: false,
      );
    });
  }
}
