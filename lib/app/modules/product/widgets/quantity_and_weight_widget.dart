import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  final bool isKg;
  const QuantityAndWeightWidget({super.key, this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) {
        return Column(
          children: [QuantityWidget(), WeightWidget()],
        );
      },
    );
  }
}

class QuantityWidget extends StatelessWidget {
  final controller = Get.find<QuantityAndWeightController>();

  QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    var isKg = controller.isKg;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: quantity > 1
              ? () {
                  controller.changeQuantity(quantity - 1);
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.remove),
        ),
        Container(
          width: isKg ? 96 : 48,
          padding: const EdgeInsets.all(8),
          child: Text(
            NumberFormat.decimalPattern().format(quantity) + (isKg ? 'Kg' : ''),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.changeQuantity(quantity + 1);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class WeightWidget extends StatelessWidget {
  final controller = Get.find<QuantityAndWeightController>();

  WeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Slider(
        min: 1,
        max: 2,
        divisions: 19,
        value: controller.weight,
        onChanged: controller.changeWeight);
  }
}

class QuantityAndWeightController extends GetxController {
  bool isKg;

  QuantityAndWeightController({required this.isKg});

  num quantity = 1;
  double get weight => quantity.toDouble();

  void changeQuantity(num value) {
    quantity = value;

    update();
  }

  void changeWeight(double value) {
    quantity = value;

    update();
  }
}
