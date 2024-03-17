import 'package:app_hortifruti/app/modules/cart/cart_bindings.dart';
import 'package:app_hortifruti/app/modules/cart/cart_page.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_bindings.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_page.dart';
import 'package:app_hortifruti/app/modules/dashboard/dashboard_bindings.dart';
import 'package:app_hortifruti/app/modules/dashboard/dashboard_page.dart';
import 'package:app_hortifruti/app/modules/login/login_bindings.dart';
import 'package:app_hortifruti/app/modules/login/login_page.dart';
import 'package:app_hortifruti/app/modules/product/product_bindings.dart';
import 'package:app_hortifruti/app/modules/product/product_page.dart';
import 'package:app_hortifruti/app/modules/store/store_bindings.dart';
import 'package:app_hortifruti/app/modules/store/store_page.dart';
import 'package:app_hortifruti/app/modules/user_address/user_address_bindings.dart';
import 'package:app_hortifruti/app/modules/user_address/user_address_page.dart';
import 'package:app_hortifruti/app/modules/user_address_list/user_address_list_bindings.dart';
import 'package:app_hortifruti/app/modules/user_address_list/user_address_list_page.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: Routes.store,
      page: () => StorePage(),
      binding: StoreBindings(),
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: ProductBindings(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => CartPage(),
      binding: CartBindings(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => CheckoutPage(),
      binding: CheckoutBindings(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.userAddress,
      page: () => UserAddressPage(),
      binding: UserAddressBindings(),
    ),
    GetPage(
      name: Routes.userAddress,
      page: () => UserAddressPage(),
      binding: UserAddressBindings(),
    ),
    GetPage(
      name: Routes.userAddressList,
      page: () => UserAddressListPage(),
      binding: UserAddressListBindings(),
    ),
  ];
}
