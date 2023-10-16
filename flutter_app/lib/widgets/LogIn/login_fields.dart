import 'package:flutter/material.dart';
import 'package:flutter_app/screens/classes_screen.dart';
import 'package:flutter_app/widgets/input_field.dart';

import '../../model/User.dart';

class LogInFields extends StatelessWidget {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserType? type;
  final Future<void> Function(String cpf, String password, BuildContext context)
      login;

  LogInFields({super.key, required this.type, required this.login});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(hintText: "CPF", controller: cpfController),
        const SizedBox(height: 20),
        InputField(
            hintText: "Senha",
            controller: passwordController,
            isPassword: true),
        const SizedBox(height: 20),
        _loginBtn(context),
      ],
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        login(cpfController.text, passwordController.text, context);
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 10),
          maximumSize: const Size(240, double.infinity)),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
