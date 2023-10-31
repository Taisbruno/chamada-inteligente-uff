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
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // Logic to export the data as a sheet.
                // For example, you might want to use plugins/packages like `excel` to create an Excel sheet
                // and then use `share` to share/export it.
              },
              icon: Icon(Icons.download_rounded, color: Colors.white),  // Adding an icon for more interactivity
              label: Text(
                'Exportar como planilha',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // This sets the background color of the button
                onPrimary: Colors.white, // This sets the color of the icon and text
                shape: RoundedRectangleBorder( // This gives the button rounded corners
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjusts the button's padding
              ),
            ),
            SizedBox(width: 8)  // To provide a bit of spacing on the right side
          ],

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
