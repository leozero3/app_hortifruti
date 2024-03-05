import 'package:app_hortifruti/app/data/models/address_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class CheckoutRepository {
  final Api _api;

  CheckoutRepository(this._api);

  Future<List<AddressModel>> getUserAddresses() => _api.getUserAddresses();
}
