import 'package:flutter/material.dart';
import 'package:flutter_app/screens/classes_screen.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100]!,
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Alinha para o início da coluna
          children: [
            SizedBox(height: 50), // Adiciona espaço no topo
            Text(
              'Chamada Inteligente',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.purple[500],
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.purple,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
            Spacer(), // Preenche o espaço restante
            Image.asset('assets/classroom.png'),
            Spacer(), // Preenche o espaço restante
          ],
        ),
      ),
    );
  }
}
