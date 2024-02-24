import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
    
    const CheckoutPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('CheckoutPage'),),
            body: Container(),
        );
    }
}