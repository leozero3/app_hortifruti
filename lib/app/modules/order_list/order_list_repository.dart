import 'package:app_hortifruti/app/data/models/order_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class OrderListRepository {
  final Api _api;

  OrderListRepository(this._api);

  Future<List<OrderModel>> getOrders() {
    return _api.getOrders();
  }
}
