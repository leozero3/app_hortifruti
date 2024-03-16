import 'package:app_hortifruti/app/data/models/user_model.dart';
import 'package:app_hortifruti/app/data/models/user_profile_request_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_service.dart';
import 'package:app_hortifruti/app/modules/user_profile/user_profile_repository.dart';
import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController with StateMixin<UserModel> {
  final UserProfileRepository _repository;

  UserProfileController(this._repository);

  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void onInit() {
    _repository.getUser().then((data) {
      nameController.text = data.name;
      emailController.text = data.email;
      phoneController.text = data.phone;
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
    super.onInit();
  }

  Future<void> logout() async {
    await _authService.logout();

    Get.offAllNamed(Routes.dashboard);
  }

  void submit() {
    Get.focusScope!.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    var userAddressRequest = UserProfileRequestModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );
    _repository.putUser(userAddressRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text('Seu perfil foi atualizado com sucesso!'),
        ),
      );
      passwordController.text = '';
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }
}
