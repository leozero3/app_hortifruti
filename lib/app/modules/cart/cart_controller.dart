import 'package:app_hortifruti/app/data/models/cart_product_model.dart';
import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _cartService = Get.find<CartService>();

  List<CartProductModel> get products => _cartService.products;
}
