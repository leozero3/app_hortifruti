import 'package:app_hortifruti/app/data/models/city_model.dart';
import 'package:app_hortifruti/app/data/models/user_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class UserProfileRepository {
  final Api _api;

  UserProfileRepository(this._api);

  Future<UserModel> getUser() {
    return _api.getUser();
  }

  // Future<void> postAddress(UserProfileRequestModel userAddressRequestModel) {
  //   return _api.postAddress(userAddressRequestModel);
  // }
}
