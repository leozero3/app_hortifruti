import 'package:app_hortifruti/app/modules/regiter/register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o seu nome';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o seu Email';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o seu Telefone';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                obscureText: true,
                validator: (value) {
                  if (value != null && (value.isEmpty || value.length < 8)) {
                    return 'Informe uma senha valida maior que 8 caracteres';
                  }

                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.submit,
                        child: const Text('Cadastrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
