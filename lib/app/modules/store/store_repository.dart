import 'package:app_hortifruti/app/data/models/store_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class StoreRepository {
  final Api _api;

  StoreRepository(this._api);

  Future<StoreModel> getStore(int id) async {
    return _api.getStore(id);
  }
}
