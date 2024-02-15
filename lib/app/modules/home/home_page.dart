import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Pressione o botao'),
          Obx(() {
            return Text('${controller.counter}');
          }),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'incrementar',
        child: Icon(Icons.add),
      ),
    );
  }
}
