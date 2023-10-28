import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/services/login/login_service.dart';
import 'package:flutter_app/widgets/LogIn/login_fields.dart';
import 'package:flutter_app/widgets/SignUp/active_button.dart';
import 'package:provider/provider.dart';

import '../model/User.dart';
import '../providers/UserProvider.dart';

class FinishedCallScreen extends StatefulWidget {
  const FinishedCallScreen({super.key});

  @override
  State<FinishedCallScreen> createState() => _FinishedCallPageState();
}

class _FinishedCallPageState extends State<FinishedCallScreen> {
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
          title: const Text("Finished Call",
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
    return const Column(
      children: [
        Row(
          children: [
            Card(),
            Card(),
          ],
        ),
      ],
    );
  }
}
