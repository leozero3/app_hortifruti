import 'package:app_hortifruti/app/modules/user_address/user_address_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserAddressPage extends GetView<UserAddressController> {
  const UserAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editing = controller.editing.isTrue;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(editing ? 'Editar Endereço' : 'Novo endereço'),
      ),
      body: controller.obx(
        (state) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Form(
            key: controller.formKey,
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
                const SizedBox(height: 20),
                DropdownButtonFormField(
                    value: controller.cityId.value,
                    items: state!
                        .map(
                          (city) => DropdownMenuItem<int>(
                            value: city.id,
                            child: Text(city.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.changeCity(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Cidade',
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione uma cidade';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: controller.submit,
                          child: Text(editing ? 'Atualizar' : 'Adicionar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
