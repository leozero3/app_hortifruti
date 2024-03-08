import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class UserAddressRepository {
  final Api _api;

  UserAddressRepository(this._api);

  Future<List<CityModel>> getCities() {
    return _api.getCities();
  }
}
