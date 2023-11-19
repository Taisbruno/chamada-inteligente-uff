import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../models/Schedule.dart';
import '../services/schedule_service.dart';
import '../utils/date_time_utils.dart';

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
  TextEditingController locationController = TextEditingController();
  List<String> daysOfWeek = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];
  List<String> selectedDays = [];

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
    );
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

  Widget buildDaysOfWeekChips() {
    return Wrap(
      spacing: 8.0, // Gap between chips
      children: List<Widget>.generate(
        daysOfWeek.length,
        (int index) {
          return ChoiceChip(
            label: Text(daysOfWeek[index]),
            selected: selectedDays.contains(daysOfWeek[index]),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  selectedDays.add(daysOfWeek[index]);
                } else {
                  selectedDays.removeWhere((String name) {
                    return name == daysOfWeek[index];
                  });
                }
              });
            },
          );
        },
      ),
    );
  }

  Future<void> _sendScheduleToBackend() async {
    Uri url = Uri.parse('http://localhost:8443/schedule/create-schedule/');

    for (var day in selectedDays) {
      int dayOfWeek = daysOfWeek.indexOf(day) + 1;

      Map<String, dynamic> data = {
        "classCode": widget.classCode,
        "dayOfWeek": dayOfWeek,
        "startTime": _formatTimeOfDay(startTime),
        "endTime": _formatTimeOfDay(endTime),
        "longitude": locationController.text.split(',')[0].trim(),
        "latitude": locationController.text.split(',')[1].trim(),
      };

      var response = await http.post(url,
          body: json.encode(data),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        _showSnackBar(context, "Chamada Agendada!", Colors.green);
      } else {
        _showSnackBar(context, "Ocorreu um erro: ${response.body}", Colors.red);
      }
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format =
        DateFormat('HH:mm:ss'); // Use the intl package for formatting
    return format.format(dt);
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    buildDaysOfWeekChips(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListTile(
                  title: Text(
                    'Hora Início Chamada: ${startTime.format(context)}',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(Icons.access_time, color: Colors.white),
                  onTap: () => _selectTime(context, true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListTile(
                  title: Text('Hora Fim Chamada: ${endTime.format(context)}',
                      style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.access_time, color: Colors.white),
                  onTap: () => _selectTime(context, false),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                      labelText: 'Local',
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
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
