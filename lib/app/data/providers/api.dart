import 'dart:convert';

import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:app_hortifruti/app/data/models/user_login_request_model.dart';
import 'package:app_hortifruti/app/data/models/user_login_response_model.dart';
import 'package:app_hortifruti/app/data/services/storage/storage_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  final _storageService = Get.find<StorageService>();
  @override
  void onInit() {
    // httpClient.baseUrl = "http://192.168.15.4:3333/"; //work
    httpClient.baseUrl = "http://192.168.96.1:3333/"; //home

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

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    var response = _errorHandler(await post('login', jsonEncode(data)));
    return UserLoginResponseModel.fromJson(response.body);
  }

  Future<List<StoreModel>> getStores() async {
    var response = _errorHandler(await get('cidades/1/estabelecimentos'));
    List<StoreModel> data = [];
    for (var store in response.body) {
      data.add(StoreModel.fromJson(store));
    }
    return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = _errorHandler(await get('estabelecimentos/$id'));

    return StoreModel.fromJson(response.body);
  }

  // retorna erro caso a resposta de erro
  Response _errorHandler(Response response) {
    print(response.bodyString);
    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;

      default:
        throw Exception('Ocorreu um erro');
    }
  }
}
