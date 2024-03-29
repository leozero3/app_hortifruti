import 'package:app_hortifruti/app/data/models/user_model.dart';
import 'package:app_hortifruti/app/data/models/user_profile_request_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class RegisterRepository {
  final Api _api;

  RegisterRepository(this._api);

  Future<UserModel> getUser() {
    return _api.getUser();
  }

  Future<UserModel> register(UserProfileRequestModel userProfileRequest) =>
      _api.register(userProfileRequest);
}
