import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = "http://172.21.176.1:3333/"; //work
    httpClient.baseUrl = "http://172.27.128.1:3333/"; //home

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    super.onInit();
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
