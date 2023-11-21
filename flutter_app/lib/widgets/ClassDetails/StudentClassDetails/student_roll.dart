import 'package:flutter/material.dart';
import 'package:flutter_app/utils/TwoDigits.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/dialog_missed_class.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentRollData extends StatelessWidget {
  final String date;
  final bool presence;
  final String? certificate;
  final String rollId;
  final String registration;
  final dynamic refetch;

  const StudentRollData(
      {super.key,
      required this.date,
      required this.presence,
      required this.rollId,
      required this.registration,
      required this.refetch,
      this.certificate});

  @override
  Widget build(BuildContext context) {
    DateTime dtDate = DateTime.parse(date);

    String numberData =
        '${twoDigits(dtDate.day)}/${twoDigits(dtDate.month)}/${dtDate.year}';
    String numberHour = '${twoDigits(dtDate.hour)}:${twoDigits(dtDate.minute)}';
    String stringPresence = presence ? "Sim" : "Não";

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.blue[100], // You can customize the card color
      child: ListTile(
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Data: $numberData',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              Text('Horário: $numberHour',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              Text('Presente: $stringPresence',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
            ],
          ),
          trailing: getTrailing(context)),
    );
  }

  Widget? getTrailing(BuildContext context) {
    if (!presence) {
      if (certificate == null) {
        return buttonMissedClass(context);
      } else {
        return buttonCheckCertificate(context, certificate!);
      }
    }

    return Icon(Icons.check_circle_outline, color: Colors.green[800]);
  }

  Widget? buttonMissedClass(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                    child: MissedClassDialog(
                      registration: registration,
                      rollId: rollId,
                      refetch: refetch,
                    ),
                  ));
        },
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 30)),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            'Justificar\nFalta',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget? buttonCheckCertificate(BuildContext context, String url) {
    return ElevatedButton(
        onPressed: () async {
          launchUrl(Uri.parse(url));
        },
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 30)),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            'Abrir\natestado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
