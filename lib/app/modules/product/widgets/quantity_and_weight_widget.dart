import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  bool isKg;
  QuantityAndWeightWidget({this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) {
        return Column(
          children: [QuantityWidget()],
        );
      },
    );
  }
}

class QuantityWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

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
          width: 48,
          padding: EdgeInsets.all(8),
          child: Text(
            NumberFormat.decimalPattern().format(quantity) + (isKg ? 'Kg' : ''),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

class QuantityAndWeightController extends GetxController {
  bool isKg;

  QuantityAndWeightController({required this.isKg});

  num quantity = 1;

  void changeQuantity(num value) {
    quantity = value;

    update();
  }
}
