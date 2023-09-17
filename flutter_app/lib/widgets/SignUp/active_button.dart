import 'package:flutter/material.dart';
import 'package:flutter_app/screens/signup_screen.dart';

class ActiveButton extends StatelessWidget {
  final UserType? type;
  final UserType? expectedType;
  final String textContent;

  const ActiveButton(
      {super.key,
      required this.type,
      required this.expectedType,
      required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: type == expectedType ? Colors.white : Colors.transparent,
          border: Border.all(color: Colors.white, width: 1.0),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: 180,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          textContent,
          style: TextStyle(
              color: type == expectedType
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
