import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import './product_controller.dart';

class ProductPage extends GetView<ProductController> {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = controller.product.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            if (product.image.isNotEmpty) ...[
              Align(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.image,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
            if (product.description != null)
              Text(
                product.description!,
                style: Get.textTheme.titleMedium,
              ),
            Text(
              NumberFormat.simpleCurrency().format(product.price) +
                  (product.isKG ? '/Kg' : ''),
              style: Get.textTheme.titleLarge,
            ),
            TextField(
              controller: controller.observationController,
              decoration: const InputDecoration(labelText: 'Observação'),
              maxLength: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.addToCart();
                },
                child: const Text('Adicionar no carrrinho'),
              ),
            )
          ],
        ),
      ),
    );
  }
}