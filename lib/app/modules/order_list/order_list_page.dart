import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './order_list_controller.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.login),
              child: const Text('Entrar com minha conta')),
        ));
  }
}
