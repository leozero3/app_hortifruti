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
    return Row(
      children: [
        Text(
          '${NumberFormat.decimalPattern().format(controller.min)}Kg',
          style: Get.textTheme.labelSmall,
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (details) => controller.enableSlider(),
            child: Slider(
              min: controller.min,
              max: controller.max,
              divisions: 19,
              label: controller.label,
              value: controller.weight,
              onChanged: (value) {
                if (controller.sliderEnable.isTrue) {
                  controller.changeWeight(value);
                }
              },
            ),
          ),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(controller.max)}Kg',
          style: Get.textTheme.labelSmall,
        ),
      ],
    );
  }
}

class QuantityAndWeightController extends GetxController {
  QuantityAndWeightController({required this.isKg});

  bool isKg;
  num quantity = 1;
  double get weight => quantity.toDouble();
  late double min;
  late double max;
  final sliderEnable = false.obs;

  String get label {
    String unit = 'Kg';
    String pattern = '0.00';
    var number = weight;

    if (number < 1) {
      number *= 1000;
      unit = 'g';
      pattern = '';
    }
    return NumberFormat(pattern).format(number) + unit;
  }

  @override
  void onInit() {
    _updateMinAndMax();
    super.onInit();
  }

  void changeQuantity(num value) {
    quantity = value;

    update();
    _updateMinAndMax();
  }

  void changeWeight(double value) {
    quantity = value;

    update();
  }

  void _updateMinAndMax() {
    min = weight - 1 + 0.05;
    max = weight;

    if (min < 0) {
      min = 0.05;
      max = 1;
    }
  }

  void enableSlider() => sliderEnable.value = true;
}
