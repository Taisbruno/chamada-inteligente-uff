import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_call.dart';

class FinishedClassScreen extends StatefulWidget {
  final HistoryRoll historyRoll;

  const FinishedClassScreen({super.key, required this.historyRoll});

  @override
  State<FinishedClassScreen> createState() => _FinishedClassState();
}

class _FinishedClassState extends State<FinishedClassScreen> {
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
          title: const Text('Chamada Ocorrida',
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
    return finishedCall(widget.historyRoll, context);
  }
}
