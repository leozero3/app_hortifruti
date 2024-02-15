import 'package:app_hortifruti/app/modules/home/home_bindings.dart';
import 'package:app_hortifruti/app/modules/home/home_page.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
      binding: HomeBindings(),
    )
  ];
}
