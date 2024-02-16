import 'package:app_hortifruti/app/modules/dashboard/dashboard_bindings.dart';
import 'package:app_hortifruti/app/modules/dashboard/dashboard_page.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBindings(),
    ),
  ];
}
