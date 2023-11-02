import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/model/Roll.dart';
import 'package:flutter_app/providers/UserProvider.dart';
import 'package:flutter_app/services/roll/presence/presence_service.dart';
import 'package:flutter_app/utils/geolocation/Distance.dart';
import 'package:flutter_app/utils/geolocation/Geolocator.dart';
import 'package:flutter_app/utils/Toast.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/dialog_presence_confirmed.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/student_roll.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ClassDetailsData {
  String classCode;
  String className;
  String teacher;
  String semester;
  String description;
  Roll? openRoll;
  List<HistoryRoll> historic = [];
  String userRegistration;

  ClassDetailsData(
      {required this.classCode,
      required this.className,
      required this.teacher,
      required this.semester,
      required this.description,
      required this.openRoll,
      required this.historic,
      required this.userRegistration});
}

Widget studentClassDetails(ClassDetailsData details, BuildContext context,
    bool isPresent, Function updatePresence, bool isLoading) {
  TextEditingController endTimecontroller = TextEditingController();

  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Detalhes da Turma:',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Professor: ${details.teacher}',
          style: const TextStyle(color: Colors.white),
        ),
        Text('Semestre: ${details.semester}',
            style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        const Text(
          'Descrição da matéria',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(details.description, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getFirstButton(context, details.openRoll, isPresent,
                userProvider.registration!, updatePresence),
            button(
                onPressed: () {
                  print("Em desenvolvimento");
                },
                title: "Automático",
                color: Colors.blue), //toggle
          ],
        ),
        const SizedBox(height: 20),
        if (!isLoading)
          studentsInfo(details.historic, details.userRegistration),
        if (isLoading) const CircularProgressIndicator()
      ]));
}

Widget studentsInfo(List<HistoryRoll> snapshot, String studentRegistration) {
  return Expanded(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Chamadas Ocorridas (${snapshot.length}):',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            //arrumar a chamada para o construtor StudentRollData, variavel presence

            return studentRoll(StudentRollData(
                date: snapshot[index].createdAt,
                presence: checkIsPresent(
                    snapshot[index].presences, studentRegistration)));
          },
        ),
      )
    ],
  ));
}

Widget getFirstButton(BuildContext context, Roll? openRoll, bool isPresent,
    String registration, Function updatedPresence) {
  if (isPresent) {
    return const Row(
      children: [
        Text(
          "Presença\nConfirmada",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )
      ],
    );
  } else {
    return button(
        onPressed: () async {
          determinePosition()
              .then((value) => handleRegisterPresence(
                  context, value, openRoll!, registration, updatedPresence))
              .onError((error, stackTrace) =>
                  showToast(context, error.toString(), "Entendi"));
        },
        title: "Registrar Presença",
        color: Colors.green,
        disabled: openRoll == null);
  }
}

void handleRegisterPresence(BuildContext context, Position position,
    Roll openRoll, String registration, Function updatePresence) {
  bool isAllowed = isClose(position, double.parse(openRoll.latitude),
      double.parse(openRoll.longitude));

  if (isAllowed) {
    createPresence(registration, openRoll.rowId).then((response) {
      if (response.statusCode == 200) {
        updatePresence();
        showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
                  child: dialogPresenceConfirmed(context),
                ));
      }
    });
  } else {
    showToast(
        context,
        "Você está muito distante do professor. Não foi possível confirmar a presença",
        "OK");
  }
}

Widget noRegistry() {
  return Center(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: const Text(
        "Nenhum registro de chamada encontrado.",
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

bool checkIsPresent(List<Presence> presences, String registration) {
  bool isPresent = presences
      .where((element) => element.isPresent)
      .map((e) => e.studentRegistration)
      .contains(registration);

  return isPresent;
}
