import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/modules/home/home_controller.dart';
import 'package:app_hortifruti/app/modules/home/home_repository.dart';
import 'package:app_hortifruti/app/modules/order_list/order_list_controller.dart';
import 'package:app_hortifruti/app/modules/order_list/order_list_repository.dart';
import 'package:app_hortifruti/app/modules/user_profile/user_profile_controller.dart';
import 'package:app_hortifruti/app/modules/user_profile/user_profile_repository.dart';
import 'package:get/get.dart';
import './dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());

    Get.lazyPut<HomeController>(
        () => HomeController(HomeRepository(Get.find<Api>())));

    Get.lazyPut<UserProfileController>(
        () => UserProfileController(UserProfileRepository(Get.find<Api>())));

    Get.lazyPut<OrderListController>(
        () => OrderListController(OrderListRepository(Get.find<Api>())));
  }
}
