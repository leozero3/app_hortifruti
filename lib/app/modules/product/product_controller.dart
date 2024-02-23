import 'dart:async';

import 'package:app_hortifruti/app/data/models/cart_product_model.dart';
import 'package:app_hortifruti/app/data/models/product_model.dart';
import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:app_hortifruti/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];
    super.onInit();
  }

  void addToCart() {
    var quantity = Get.find<QuantityAndWeightController>().quantity;

    // _cartService.newCart(store.value!);
    _cartService.addProductToCart(
      CartProductModel(
        product: product.value!,
        quantity: quantity,
        observation: observationController.text,
      ),
    );
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content: Text(
          'O item ${product.value!.name} foi adicionado no carrinho',
        ),
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () => Get.back());
  }
}
