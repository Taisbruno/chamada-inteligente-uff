import 'package:flutter/material.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/screens/classes_screen.dart';
import 'package:flutter_app/widgets/input_field.dart';

class SignUpFields extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final UserType? type;

  SignUpFields({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(hintText: "Nome completo", controller: nameController),
        const SizedBox(height: 20),
        InputField(hintText: "CPF", controller: cpfController),
        const SizedBox(height: 20),
        InputField(hintText: "Matricula", controller: registrationController),
        const SizedBox(height: 20),
        InputField(hintText: "Email", controller: emailController),
        const SizedBox(height: 20),
        InputField(
            hintText: "Senha",
            controller: passwordController,
            isPassword: true),
        const SizedBox(height: 20),
        InputField(
            hintText: "Confirmação de Senha",
            controller: passwordConfirmationController,
            isPassword: true),
        const SizedBox(height: 50),
        _loginBtn(context),
      ],
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Username : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TeacherClassesScreen()));
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
            "Cadastrar",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
