part of './pages.dart';

abstract class Routes {
  static const dashboard = '/';
  static const store = '/store/:id';
  static const product = '/product';
  static const cart = '/cart';
  static const checkout = '/checkout';
  static const login = '/login';
  static const register = '/regiter';
  static const userAddress = '/user-address';
  static const userAddressList = '/user-address-list';
  static const orderListPage = '/order-list';
  static const order = '/order/:id';
  static const selectCity = '/select-city';
}
