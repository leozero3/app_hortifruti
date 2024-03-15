import 'package:app_hortifruti/app/modules/home/home_page.dart';
import 'package:app_hortifruti/app/modules/user_address%20copy/user_profile_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          onDestinationSelected: controller.changePageIndex,
          selectedIndex: controller.currentPageIndex.value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              label: 'Inicio',
              selectedIcon: Icon(Icons.explore),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Meu Perfil',
              selectedIcon: Icon(Icons.person),
            ),
            NavigationDestination(
              icon: Icon(Icons.view_list_outlined),
              label: 'Meus Pedidos',
              selectedIcon: Icon(Icons.view_list),
            ),
          ],
        );
      }),
      body: Obx(() {
        return IndexedStack(
          index: controller.currentPageIndex.value,
          children: [
            HomePage(),
            UserProfilePage(),
            Text('Meus Pedidos'),
          ],
        );
      }),
    );
  }
}
