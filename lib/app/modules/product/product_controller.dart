import 'package:app_hortifruti/app/data/models/product_model.dart';
import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];
    super.onInit();
  }

  void addToCart() {
    observationController.text;
  }
}
