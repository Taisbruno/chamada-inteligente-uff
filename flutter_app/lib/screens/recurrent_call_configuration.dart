import 'package:flutter/material.dart';
import 'package:flutter_app/model/Schedule.dart';
import 'package:flutter_app/services/schedule/schedule_service.dart';
import 'package:flutter_app/utils/Date_Time.dart';
import 'package:flutter_app/utils/Toast.dart';
import 'package:flutter_app/widgets/RecurrentCall/days_of_week_chips.dart';
import 'package:flutter_app/widgets/RecurrentCall/locales_dropdown.dart';
import 'package:http/http.dart';

class RecurrentChamadaConfiguration extends StatefulWidget {
  final String classCode; // Assuming you pass classCode to this widget

  const RecurrentChamadaConfiguration({super.key, required this.classCode});

  @override
  RecurrentChamadaConfigurationState createState() =>
      RecurrentChamadaConfigurationState();
}

class RecurrentChamadaConfigurationState
    extends State<RecurrentChamadaConfiguration> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime =
      TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);
  LocaleData localeData = locales.first;
  List<String> daysOfWeek = [
    'Domingo',
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
  ];
  List<String> selectedDays = [];

  void updateCoordinates(LocaleData receivedLocale) {
    setState(() {
      localeData = receivedLocale;
    });
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: isStartTime ? startTime : endTime,
        hourLabelText: 'Hora',
        minuteLabelText: 'Minuto',
        helpText: 'Selecione um horário',
        initialEntryMode: TimePickerEntryMode.input);
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  Future<void> _sendScheduleToBackend() async {
    selectedDays.forEach((element) async {
      int day = daysOfWeek.indexOf(element);

      Schedule schedule = Schedule(
          classCode: widget.classCode,
          dayOfWeek: day,
          startTime: DateTimeUtils.formatTimeOfDay(startTime),
          endTime: DateTimeUtils.formatTimeOfDay(endTime),
          longitude: localeData.longitude,
          latitude: localeData.latitude);

      Response response = await ScheduleService().createSchedule(schedule);

      print(response.body);

      if (response.statusCode == 200) {
        showToast(context, "Chamada Agendada!", "OK");
      } else {
        showToast(context, "Ocorreu um erro: ${response.body}", "OK");
      }
    });
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
          title: const Text("Agendar Chamada",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dia da semana:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    buildDaysOfWeekChips(daysOfWeek, selectedDays, setState),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: ListTile(
                  title: Text(
                    'Hora Início Chamada: ${startTime.format(context)}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.access_time, color: Colors.white),
                  onTap: () => _selectTime(context, true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: ListTile(
                  title: Text('Hora Fim Chamada: ${endTime.format(context)}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  trailing: Icon(Icons.access_time, color: Colors.white),
                  onTap: () => _selectTime(context, false),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Localidade:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: localesDropdown(localeData, updateCoordinates)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _sendScheduleToBackend();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      'Confirmar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
