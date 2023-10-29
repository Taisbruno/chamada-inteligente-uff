import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/services/login/login_service.dart';
import 'package:flutter_app/widgets/LogIn/login_fields.dart';
import 'package:flutter_app/widgets/SignUp/active_button.dart';
import 'package:provider/provider.dart';

import '../model/User.dart';
import '../providers/UserProvider.dart';
import 'classes_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserType? _type = UserType.teacher;
  bool isLoading = false;

  Future<void> login(String cpf, String password, BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    final response = await authenticate(cpf, password);
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final User user = User.fromJson(jsonDecode(response.body));
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(
          registration: user.registration,
          name: user.name,
          email: user.email,
          cpf: user.cpf,
          type: user.type);

      Navigator.of(context).pushNamed('/classes');
    } else {
      _showToast(context);
    }
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Erro ao realizar login: CPF ou senha incorretos'),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

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
          title: const Text("Login",
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
          loginFields(
              _type!, login, context, usernameController, passwordController),
          const SizedBox(height: 20),
          if (isLoading)
            const CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.purple,
            ),
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
                _type = UserType.teacher;
              });
            },
            child: ActiveButton(
                type: _type,
                expectedType: UserType.teacher,
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
          "Não possui uma conta? Cadastre-se aqui.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
