import 'package:flutter/material.dart';
import 'package:flutter_app/services/roll/roll_service.dart';
import 'package:flutter_app/widgets/RollHistory/roll_history.dart';
import 'package:flutter_app/widgets/shared/loading.dart';

class ClassRollHistoricScreen extends StatefulWidget {
  final String classCode;

  const ClassRollHistoricScreen({super.key, required this.classCode});

  @override
  State<ClassRollHistoricScreen> createState() =>
      _ClassRollHistoricScreenState();
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
    return FutureBuilder(
        future: getClassHistoric(widget.classCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return circularLoading();
          } else if (!snapshot.hasData) {
            return const Center(
                child: Text("Essa turma ainda não possui uma chamada realizada",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)));
          } else {
            return rollHistory(context, snapshot.data!);
          }
        });
  }
}
