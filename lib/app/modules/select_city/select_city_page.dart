import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './select_city_controller.dart';

class SelectCityPage extends GetView<SelectCityController> {
  const SelectCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Selecione uma Cidade'),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
              children: [
                for (var city in state!)
                  ListTile(
                    title: Text(
                      '${city.name} / ${city.uf}',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => controller.onSelected(city),
                  )
              ],
            ),
          ),
        ));
  }
}
