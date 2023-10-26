import 'package:flutter/material.dart';

class TimerField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Color color;

  const TimerField({
    super.key,
    required this.hintText,
    required this.controller,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color));

    return TextField(
      style: TextStyle(color: color),
      cursorColor: color,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: color),
        enabledBorder: border,
        focusedBorder: border,
      ),
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
            hourLabelText: 'Hora',
            minuteLabelText: 'Minuto',
            helpText: 'Selecione um horário',
            initialEntryMode: TimePickerEntryMode.input);

        if (pickedTime != null) {
          String text = pickedTime.format(context);
          controller.text = text;
        } else {
          controller.text = "";
        }
      },
    );
  }
}
