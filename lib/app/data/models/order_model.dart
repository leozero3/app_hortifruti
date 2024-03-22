import 'package:app_hortifruti/app/data/models/order_status_model.dart';
import 'package:app_hortifruti/app/data/models/store_model.dart';

class OrderModel {
  String hashId;
  StoreModel store;
  num value;
  num deliveryCost;
  List<OrderStatusModel> statusList;
  String? observation;
  DateTime createdAt;

  OrderModel({
    required this.hashId,
    required this.store,
    required this.value,
    required this.deliveryCost,
    required this.statusList,
    this.observation,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      hashId: json['hash_id'],
      store: StoreModel.fromJson(json['estabelecimento']),
      value: double.parse(json['valor']?.toString() ?? '0.0'),
      deliveryCost: double.parse(json['custo_entrega']?.toString() ?? '0.0'),
      statusList: json['pedido_status'] == null
          ? []
          : List<OrderStatusModel>.from(json['pedido_status']
              .map((status) => OrderStatusModel.fromJson(status))),
      observation: json['observacao'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
