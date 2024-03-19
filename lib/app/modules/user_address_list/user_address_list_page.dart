import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './user_address_list_controller.dart';

class UserAddressListPage extends GetView<UserAddressListController> {
  const UserAddressListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Meus Endereços',
        ),
      ),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: controller.goToNewAddress,
                        icon: const Icon(Icons.add_location),
                        label: const Text('Novo Endereço'),
                      ),
                    ),
                  ],
                ),
              ),
              for (var address in state!)
                ListTile(
                  title: Text('${address.street}, n° ${address.number}'),
                  subtitle:
                      Text('${address.neighborhood}, n° ${address.city!.name}'),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case 'delete':
                          controller.deleteAddress(address);
                          break;
                        case 'edit':
                          controller.goToEditAddress(address);
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Editar'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Excluir'),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
