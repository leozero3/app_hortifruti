import 'package:app_hortifruti/app/data/models/user_login_request_model.dart';
import 'package:app_hortifruti/app/data/models/user_login_response_model.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';

class AuthRepository {
  final Api _api;

  AuthRepository(this._api);

  Future<UserLoginResponseModel> login(
          UserLoginRequestModel userLoginRequest) async =>
      _api.login(userLoginRequest);
}
