import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

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
                leading: SizedBox(
                  width: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: store.image!,
                    ),
                  ),
                ),
                trailing: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: store.isOnline ? Colors.green : Colors.black45,
                    border: Border.all(color: Colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    store.isOnline ? 'aberto' : 'fechado',
                    style:
                        Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                onTap: () {
                  Get.toNamed(
                      Routes.store.replaceFirst(':id', store.id.toString()));
                },
              ),
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
