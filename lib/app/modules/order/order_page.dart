import 'package:app_hortifruti/app/data/models/order_product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './order_controller.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state!.store.name,
                    style: Get.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '#${state.hashId}',
                          style: Get.textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        'Data ${DateFormat("dd/MM/y 'as' HH:mm").format(state.createdAt)}',
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Endereço de Entrega'.toUpperCase(),
                style: Get.textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${state.address!.street}, n° ${state.address!.number}, ${state.address!.neighborhood}',
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Andamento do Pedido'.toUpperCase(),
                style: Get.textTheme.titleMedium,
              ),
            ),
            for (var status in state.statusList)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  title: Text(status.name),
                  trailing: Text(DateFormat.Hm().format(status.createAt)),
                ),
              ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Produtos'.toUpperCase(),
                style: Get.textTheme.titleMedium,
              ),
            ),
            for (var orderProduct in state.productList)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  title: Text(orderProduct.product.name),
                  leading: _buildProductQuantity(orderProduct),
                  trailing: Text(
                    '${NumberFormat.simpleCurrency().format(orderProduct.total)}',
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Custo de Entrega'),
                  ),
                  Text(
                    '${NumberFormat.simpleCurrency().format(state.deliveryCost)} ',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    '${NumberFormat.simpleCurrency().format(state.value)} ',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductQuantity(OrderProductModel orderProduct) {
    return Text(
      NumberFormat.decimalPattern().format(orderProduct.quantity) +
          (orderProduct.product.isKg ? 'Kg' : 'x'),
    );
  }
}
