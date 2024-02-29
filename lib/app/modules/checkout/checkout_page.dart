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
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!controller.isLogged)
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      controller.goToLogin();
                    },
                    child: const Text('Entre com sua conta para continuar'),
                  ),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
                child: Text(
                  'Forma de Pagamento',
                  style: Get.textTheme.titleLarge,
                ),
              ),
              for (var paymentMethod in controller.paymentMethods)
                RadioListTile(
                  title: Text(paymentMethod.name),
                  value: paymentMethod,
                  groupValue: controller.paymentMethod.value,
                  onChanged: controller.changePaymentMethod,
                ),
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
                      NumberFormat.simpleCurrency()
                          .format(controller.totalCart),
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
                      NumberFormat.simpleCurrency()
                          .format(controller.totalOrder),
                      style: Get.textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              Align(
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Enviar pedido')),
              )
            ],
          );
        }),
      ),
    );
  }
}
