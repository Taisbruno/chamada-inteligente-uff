import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/RollHistory/roll_history.dart';

class ClassRollHistoricScreen extends StatefulWidget {
  @override
  _ClassRollHistoricScreenState createState() => _ClassRollHistoricScreenState();
}

class _ClassRollHistoricScreenState extends State<ClassRollHistoricScreen> {
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
          title: const Text('Histórico de Chamadas',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: _page(context),
      ),
    );
  }

  Widget _page(BuildContext context) {
    // FinishedCallData details = FinishedCallData();
    return rollHistory();
  }
}
