import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/data/models/user_address_request_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class UserAddressRepository {
  final Api _api;

  UserAddressRepository(this._api);

  Future<List<CityModel>> getCities() {
    return _api.getCities();
  }

  Future<void> postAddress(UserAddressRequestModel userAddressRequest) {
    return _api.postAddress(userAddressRequest);
  }

  Future<void> putAddress(UserAddressRequestModel userAddressRequest) {
    return _api.putAddress(userAddressRequest);
  }
}
