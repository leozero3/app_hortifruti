import 'package:app_hortifruti/app/data/models/cart_product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartPage'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(() {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  controller: controller.observationController,
                  decoration: const InputDecoration(labelText: 'Observação'),
                  maxLength: 80,
                ),
              ),
              if (controller.store != null)
                Align(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(controller.store!.name),
                  ),
                ),
              for (var cartProduct in controller.products)
                ListTile(
                  title: Text(cartProduct.product.name),
                  subtitle: Text(
                    '${NumberFormat.simpleCurrency().format(cartProduct.total)} (${NumberFormat.simpleCurrency().format(cartProduct.product.price)} un/kg)',
                  ),
                  leading: _buildProductQuantity(cartProduct),
                  trailing: IconButton(
                    onPressed: () {
                      controller.removeProduct(cartProduct);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              if (controller.products.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Seu carrinho está vazio'),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/checkout');
                  },
                  child: const Text('Avançar'),
                )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProductQuantity(CartProductModel cartProduct) {
    return Text(
      NumberFormat.decimalPattern().format(cartProduct.quantity) +
          (cartProduct.product.isKg ? 'Kg' : 'x'),
    );
  }
}
