import 'package:app_hortifruti/app/data/models/order_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class OrderRepository {
  final Api _api;

  OrderRepository(this._api);

  Future<OrderModel> getOrder(String id) {
    return _api.getOrder(id);
  }
}
