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
        body: ListView(
          children: [
            ListTile(
              title: Text('Horti Verde'),
              leading: FlutterLogo(),
              trailing: Text('Aberto'),
            )
          ],
        ));
  }
}
