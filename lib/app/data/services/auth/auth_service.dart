import 'package:app_hortifruti/app/data/models/user_login_request_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_repository.dart';
import 'package:app_hortifruti/app/data/services/storage/storage_service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final _storageService = Get.find<StorageService>();
  AuthRepository _repository;

  AuthService(this._repository);

  Future<void> login(UserLoginRequestModel userLoginRequest) async {
    var userLoginResponse = await _repository.login(userLoginRequest);
    await _storageService.saveToken(userLoginResponse.token);
    print(userLoginResponse.token);
  }
}
