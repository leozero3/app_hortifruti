import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class SelectCityRepository {
  final Api _api;

  SelectCityRepository(this._api);

  Future<List<CityModel>> getCities() => _api.getCities();
}
