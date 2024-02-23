import 'package:app_hortifruti/app/data/models/cart_product_model.dart';
import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  final List<CartProductModel> products = RxList<CartProductModel>.empty();

  final store = Rxn<StoreModel>();

  void addProductToCart(CartProductModel cartProduct) {
    products.add(cartProduct);
  }

  void newCart(StoreModel newStore) {
    store.value = newStore;
    products.clear();
  }

  void removeProduct(CartProductModel cartProduct) {
    products.remove(cartProduct);
  }
}
