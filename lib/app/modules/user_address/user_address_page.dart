import 'package:app_hortifruti/app/modules/user_address/user_address_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserAddressPage extends GetView<UserAddressController> {
  const UserAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo endereço'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.streetController,
                decoration: const InputDecoration(
                  labelText: 'Rua',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o nome da rua';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.numberController,
                decoration: const InputDecoration(
                  labelText: 'Numero',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o numero da casa/apartamento';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.neighborhoodController,
                decoration: const InputDecoration(
                  labelText: 'Bairro',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o nome do bairro';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.referenceController,
                decoration: const InputDecoration(
                  labelText: 'Ponto de referencia',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Informe um ponto de referencia';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.complementController,
                decoration: const InputDecoration(
                  labelText: 'Complemento',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.submit;
                        },
                        child: const Text('Adicionar'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
