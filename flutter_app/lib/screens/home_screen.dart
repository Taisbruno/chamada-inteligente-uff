import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100]!,
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Alinha para o início da coluna
          children: [
            const SizedBox(height: 50), // Adiciona espaço no topo
            Text(
              'Chamada Inteligente',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.purple[500],
                shadows: const [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.purple,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
            const Spacer(), // Preenche o espaço restante
            Image.asset('assets/classroom.png'),
            const Spacer(), // Preenche o espaço restante
          ],
        ),
      ),
    );
  }
}
