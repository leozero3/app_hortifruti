import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckoutPage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Produtos: ',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    NumberFormat.simpleCurrency().format(controller.totalCart),
                    style: Get.textTheme.titleMedium,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Custo de Entrega: ',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    NumberFormat.simpleCurrency()
                        .format(controller.deliveryCost),
                    style: Get.textTheme.titleMedium,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total: ',
                      style: Get.textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    NumberFormat.simpleCurrency().format(controller.totalOrder),
                    style: Get.textTheme.titleLarge,
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Enviar pedido'))
          ],
        ),
      ),
    );
  }
}
