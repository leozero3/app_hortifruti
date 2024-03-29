import 'package:app_hortifruti/app/data/models/user_login_request_model.dart';
import 'package:app_hortifruti/app/data/models/user_profile_request_model.dart';
import 'package:app_hortifruti/app/data/services/auth/auth_service.dart';
import 'package:app_hortifruti/app/modules/regiter/register_repository.dart';
import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RegisterRepository _repository;

  RegisterController(this._repository);

  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'testeregister');
  final emailController = TextEditingController(text: 'testeregister@hot.com');
  final passwordController = TextEditingController(text: 'testeregister');
  final phoneController = TextEditingController(text: '9845612333');

  void submit() {
    Get.focusScope!.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    var userProfileRequest = UserProfileRequestModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );
    _repository.register(userProfileRequest).then((value) {
      _authService.login(
        UserLoginRequestModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text('Cadastrado com Sucesso!!'),
        ),
      );
      Get.offAllNamed(Routes.dashboard);
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }
}
