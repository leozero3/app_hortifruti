import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hortifruti'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var store in state!)
              ListTile(
                title: Text(store.name),
                leading: FlutterLogo(),
                trailing: Text(store.isOnline ? 'Aberto' : 'Fechado'),
              )
          ],
        ),
        onEmpty: Center(
            child: Text(
          'Não há estabelecimentos disponiveis para sua cidade!',
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyMedium!.copyWith(color: Colors.green),
        )),
        onError: (error) => Center(
          child: Text(
            'Não foi possivel buscar od estabelecimentos. Tente mais tarde!',
            textAlign: TextAlign.center,
            style: Get.textTheme.bodyMedium!.copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
