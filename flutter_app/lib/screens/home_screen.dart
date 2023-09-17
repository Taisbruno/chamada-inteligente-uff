import 'package:flutter/material.dart';
import 'package:flutter_app/screens/classes_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100]!,
      appBar: AppBar(
        backgroundColor: Colors.purple[100]!,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Código para Registro
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[300],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Registro',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Código para Login
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[300],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassesScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[300],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Turmas',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
                color: Colors.purple[300],
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.white,
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
