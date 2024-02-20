import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './product_controller.dart';

class ProductPage extends GetView<ProductController> {
    
    ProductPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title:  Text(controller.product.value!.name),),
            body: Container(),
        );
    }
}