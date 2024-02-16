import 'package:app_hortifruti/app/modules/home/home_controller.dart';
import 'package:get/get.dart';
import './dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
