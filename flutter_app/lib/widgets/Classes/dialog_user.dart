import 'package:flutter/material.dart';
import 'package:flutter_app/providers/UserProvider.dart';
import 'package:provider/provider.dart';

Widget dialogUser(BuildContext context) {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.person,
          size: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          userProvider.name!,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 5),
        Text(
          userProvider.email!,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Text(
          'Matrícula: ${userProvider.registration!}',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName("/"));
            },
            child: const Text(
              "Sair da Conta",
              style: TextStyle(color: Colors.red),
            ))
      ],
    ),
  );
}
