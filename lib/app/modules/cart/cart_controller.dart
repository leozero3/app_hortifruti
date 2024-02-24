import 'package:app_hortifruti/app/data/models/cart_product_model.dart';
import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _cartService = Get.find<CartService>();

  List<CartProductModel> get products => _cartService.products;

  final observationController = TextEditingController();
  StoreModel? get store => _cartService.store.value;

  @override
  void onInit() {
    observationController.text = _cartService.observation.value!;
    observationController.addListener(() {
      _cartService.observation.value = observationController.text;
    });
    super.onInit();
  }

  void removeProduct(CartProductModel cartProduct) {
    _cartService.removeProductFromCart(cartProduct);
  }
}
