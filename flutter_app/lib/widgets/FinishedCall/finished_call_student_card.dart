import 'package:flutter/material.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/widgets/FinishedCall/dialog_finished_call.dart';

class FinishedCallStudentCardData {
  final List<Presence> presences;
  final String presenceId;
  final String studentName;
  final String matricula;
  final String presente;
  final int attendedClasses;
  final bool reproved;
  final String? atestado;
  final String? mensagem;

  FinishedCallStudentCardData(
      {required this.presences,
      required this.presenceId,
      required this.studentName,
      required this.matricula,
      required this.presente,
      this.attendedClasses = 10,
      this.reproved = false,
      this.atestado,
      required this.mensagem});
}

Widget finishedCallStudentCard(
    BuildContext context,
    List<String> approvedPresences,
    dynamic updateApproved,
    FinishedCallStudentCardData data) {
  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.blue[100], // You can customize the card color
    child: ListTile(
      leading: const Icon(Icons.person),
      title: Text(
        data.studentName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Matrícula: ${data.matricula}'),
          Text('Presente: ${data.presente}'),
        ],
      ),
      trailing: trailingButton(
          context,
          data.presences,
          data.presenceId,
          data.matricula,
          data.presente,
          data.atestado,
          data.mensagem,
          approvedPresences,
          updateApproved),
    ),
  );
}

Widget? trailingButton(
    BuildContext context,
    List<Presence> presences,
    String id,
    String matricula,
    String presente,
    String? atestado,
    String? mensagem,
    List<String> approvedPresences,
    dynamic updateApproved) {
  if (presente == "Não") {
    if (atestado != null && !approvedPresences.contains(matricula)) {
      return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                    child: dialog_finished_call(context, presences, id,
                        matricula, atestado, mensagem, updateApproved),
                  ));
        },
        child: const Text('Visualizar \nAtestado'),
      );
    }
    return null;
  }
  return null;
}
