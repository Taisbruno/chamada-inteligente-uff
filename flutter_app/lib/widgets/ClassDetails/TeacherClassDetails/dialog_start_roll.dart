import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Roll.dart';
import 'package:flutter_app/screens/active_call_professor.dart';
import 'package:flutter_app/services/roll/roll_service.dart';
import 'package:flutter_app/utils/geolocation/Geolocator.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:flutter_app/widgets/shared/timer_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

import '../../../utils/Toast.dart';

Widget dialogStartRoll(TextEditingController endTimeController,
    String classCode, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Iniciar Chamada',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Caso não queira programar um fim para a chamada, apenas pressione "Confirmar"',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25,
        ),
        TimerField(
          hintText: "Horário de Fim (Opcional)",
          controller: endTimeController,
          color: Colors.black87,
        ),
        const SizedBox(
          height: 30,
        ),
        button(
            onPressed: () async {
              determinePosition()
                  .then((value) => handleSuccess(
                      context, value, classCode, endTimeController.text))
                  .onError((error, stackTrace) =>
                      handleError(context, error.toString()));
            },
            title: "Confirmar",
            color: Theme.of(context).primaryColor),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.red),
            ))
      ],
    ),
  );
}

void handleSuccess(BuildContext context, Position position, String classCode,
    String time) async {
  createRoll(position.latitude.toString(), position.longitude.toString(),
          classCode)
      .then((value) async {
    if (value.statusCode == 200) {
      Roll roll = Roll.fromJson(jsonDecode(value.body));

      if (time != '') {
        await scheduleFinish(context, roll.rowId, time);
      }

      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ActiveCallScreen(
                classCode: roll.classCode,
                roll: roll,
                scheduledFinishTime: time,
              )));
    } else {
      showToast(context, "Não foi possível criar uma nova chamada", "Entendi");
      Navigator.of(context).pop();
    }
  });
}

void handleError(BuildContext context, String error) {
  showToast(context, error, "Entendi");
  Navigator.of(context).pop();
}

Future<void> scheduleFinish(
    BuildContext context, String rollId, String time) async {
  Response value = await setFinishSchedule(rollId, time);
  if (value.statusCode == 200) {
    showToast(context, "Término da chamada agendado para $time", "Entendi");
  } else {
    showToast(
        context,
        "Não foi possível agendar um término para a chamada. Você deverá finalizá-la manualmente",
        "OK");
  }
}
