import 'package:app_hortifruti/app/modules/cart/cart_bindings.dart';
import 'package:app_hortifruti/app/modules/cart/cart_page.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_bindings.dart';
import 'package:app_hortifruti/app/modules/checkout/checkout_page.dart';
import 'package:app_hortifruti/app/modules/dashboard/dashboard_bindings.dart';
import 'package:app_hortifruti/app/modules/dashboard/dashboard_page.dart';
import 'package:app_hortifruti/app/modules/login/login_bindings.dart';
import 'package:app_hortifruti/app/modules/login/login_page.dart';
import 'package:app_hortifruti/app/modules/order/order_bindings.dart';
import 'package:app_hortifruti/app/modules/order/order_page.dart';
import 'package:app_hortifruti/app/modules/order_list/order_list_page.dart';
import 'package:app_hortifruti/app/modules/product/product_bindings.dart';
import 'package:app_hortifruti/app/modules/product/product_page.dart';
import 'package:app_hortifruti/app/modules/select_city/select_city_bindings.dart';
import 'package:app_hortifruti/app/modules/select_city/select_city_page.dart';
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
      page: () => const DashboardPage(),
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
      page: () => const CartPage(),
      binding: CartBindings(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => CheckoutPage(),
      binding: CheckoutBindings(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.userAddress,
      page: () => const UserAddressPage(),
      binding: UserAddressBindings(),
    ),
    GetPage(
      name: Routes.userAddress,
      page: () => const UserAddressPage(),
      binding: UserAddressBindings(),
    ),
    GetPage(
      name: Routes.userAddressList,
      page: () => const UserAddressListPage(),
      binding: UserAddressListBindings(),
    ),
    GetPage(
      name: Routes.userAddressList,
      page: () => const OrderListPage(),
      binding: UserAddressListBindings(),
    ),
    GetPage(
      name: Routes.order,
      page: () => const OrderPage(),
      binding: OrderBindings(),
    ),
    GetPage(
      name: Routes.selectCity,
      page: () => const SelectCityPage(),
      binding: SelectCityBindings(),
      fullscreenDialog: true,
    ),
  ];
}
