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
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var order in state!)
              ListTile(
                title: Text(order.hashId),
                subtitle: Text(order.store.name),
                trailing: Chip(
                  label: Text(order.statusList.last.name),
                ),
              )
          ],
        ),
        onError: (error) => Center(
          child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.login),
              child: const Text('Entrar com minha conta')),
        ),
      ),
    );
  }
}
