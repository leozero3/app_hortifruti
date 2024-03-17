import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class UserAddressListRepository {
  final Api _api;

  UserAddressListRepository(this._api);

  Future<List<AddressModel>> getUserAddresses() {
    return _api.getUserAddresses();
  }
}
