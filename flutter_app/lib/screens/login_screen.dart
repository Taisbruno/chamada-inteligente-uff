import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/input_field.dart';
import 'package:flutter_app/widgets/LogIn/login_fields.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  UserType? _type = UserType.professor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorDark
        ],
      )),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("Cadastro",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _typeButtons(),
          const SizedBox(height: 50),
          const Text(
            "Preencha os dados abaixo:",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LogInFields(type: _type),
          const SizedBox(height: 20),
          _extraText(),
        ],
      ),
    ));
  }

  Widget _typeButtons() {
    return SizedBox(
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Selecione uma opção",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _type = UserType.student;
              });
            },
            child: ActiveButton(
                type: _type,
                expectedType: UserType.student,
                textContent: 'Sou aluno'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _type = UserType.professor;
              });
            },
            child: ActiveButton(
                type: _type,
                expectedType: UserType.professor,
                textContent: 'Sou professor'),
          )
        ],
      ),
    );
  }

  Widget _extraText() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Já possui uma conta? Faça login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
