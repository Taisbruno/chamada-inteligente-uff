import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/shared/input_field.dart';

import '../../model/User.dart';

Widget loginFields(
    UserType type,
    dynamic login,
    BuildContext context,
    TextEditingController cpfController,
    TextEditingController passwordController) {
  return Column(
    children: [
      InputField(hintText: "CPF", controller: cpfController),
      const SizedBox(height: 20),
      InputField(
          hintText: "Senha", controller: passwordController, isPassword: true),
      const SizedBox(height: 20),
      loginBtn(context, cpfController, passwordController, login),
    ],
  );
}

Widget loginBtn(BuildContext context, TextEditingController cpfController,
    TextEditingController passwordController, login) {
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
