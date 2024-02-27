import 'package:app_hortifruti/app/data/models/user_login_request_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_repository.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  AuthRepository _repository;

  AuthService(this._repository);

  login(UserLoginRequestModel userLoginRequest) {
    var data = _repository.login(userLoginRequest);
    return data;
  }
}
