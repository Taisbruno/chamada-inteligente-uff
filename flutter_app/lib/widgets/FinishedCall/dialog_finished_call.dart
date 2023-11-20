import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/services/roll/presence/presence_service.dart';
import 'package:flutter_app/utils/Toast.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

Widget dialog_finished_call(
    BuildContext context,
    List<Presence> presences,
    String id,
    String matricula,
    String? atestado,
    String? mensagem,
    dynamic updateApproved) {
  final Uri url = Uri.parse(atestado.toString().replaceAll('"', ''));

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('$atestado'),
          onPressed: () => acessarAtestado(url),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$mensagem',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25,
        ),
        const SizedBox(
          height: 30,
        ),
        button(
            onPressed: () async {
              Response response = await validatePresence(id);

              if (response.statusCode == 200) {
                updateApproved(matricula);
                showToast(context, "Presença validada", "OK");
              } else {
                showToast(context,
                    "Não foi possível validar a presença do aluno", "OK");
              }
              Navigator.of(context).pop();
            },
            title: "Validar Presença",
            color: Theme.of(context).primaryColor),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Fechar",
              style: TextStyle(color: Colors.red),
            ))
      ],
    ),
  );
}

Future<void> acessarAtestado(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Não foi possível acessar o atestado $url');
  }
}
