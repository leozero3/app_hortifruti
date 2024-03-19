import 'dart:convert';
import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/data/models/order_request_model.dart';
import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:app_hortifruti/app/data/models/user_address_request_model.dart';
import 'package:app_hortifruti/app/data/models/user_login_request_model.dart';
import 'package:app_hortifruti/app/data/models/user_login_response_model.dart';
import 'package:app_hortifruti/app/data/models/user_model.dart';
import 'package:app_hortifruti/app/data/models/user_profile_request_model.dart';
import 'package:app_hortifruti/app/data/services/storage/storage_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  final _storageService = Get.find<StorageService>();
  @override
  void onInit() {
    // httpClient.baseUrl = "http://192.168.15.4:3333/"; //work
    httpClient.baseUrl = "http://192.168.0.40:3333/"; //home
    // httpClient.baseUrl =
    // "https://dev.hortifruti.174.138.42.25.getmoss.site/"; //site

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    httpClient.addAuthenticator((Request request) {
      var token = _storageService.token;
      var headers = {'Authorization': "Bearer $token"};
      request.headers.addAll(headers);

      return request;
    });
    super.onInit();
  }

  Future<List<CityModel>> getCities() async {
    var response = _errorHandler(
      await get('cidades'),
    );
    List<CityModel> data = [];
    for (var city in response.body) {
      data.add(
        CityModel.fromJson(city),
      );
    }
    return data;
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    var response = _errorHandler(
      await post(
        'login',
        jsonEncode(data),
      ),
    );

    return UserLoginResponseModel.fromJson(response.body);
  }

  Future<UserModel> getUser() async {
    var response = _errorHandler(
      await get('auth/me'),
    );

    return UserModel.fromJson(response.body);
  }

  Future<UserModel> putUser(UserProfileRequestModel data) async {
    var response = _errorHandler(await put('cliente', jsonEncode(data)));
    return UserModel.fromJson(response.body);
  }

  Future<List<AddressModel>> getUserAddresses() async {
    var response = _errorHandler(
      await get('enderecos'),
    );

    List<AddressModel> data = [];
    for (var address in response.body) {
      data.add(
        AddressModel.fromJson(address),
      );
    }
    return data;
  }

  Future<void> postAddress(UserAddressRequestModel data) async {
    _errorHandler(
      await post(
        'enderecos',
        jsonEncode(data),
      ),
    );
  }

  Future<void> putAddress(UserAddressRequestModel data) async {
    _errorHandler(await put('enderecos/${data.id}', jsonEncode(data)));
  }

  Future<void> deleteAddress(int id) async {
    _errorHandler(await delete('enderecos/$id'));
  }

  Future<List<StoreModel>> getStores() async {
    var response = _errorHandler(await get('cidades/2/estabelecimentos'));

    List<StoreModel> data = [];
    for (var store in response.body) {
      data.add(
        StoreModel.fromJson(store),
      );
    }
    return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = _errorHandler(
      await get('estabelecimentos/$id'),
    );
    return StoreModel.fromJson(response.body);
  }

  Future postOrder(OrderRequestModel data) async {
    _errorHandler(
      await post(
        'pedidos',
        jsonEncode(data),
      ),
    );
  }

  Response _errorHandler(Response response) {
    print(response.bodyString);
    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      default:
        throw 'Ocorreu um erro';
    }
  }
}
