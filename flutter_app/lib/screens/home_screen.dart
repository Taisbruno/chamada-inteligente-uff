class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300], // Fundo azul piscina
      appBar: AppBar(
        title: Text('Chamada Inteligente'), // Título
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/classroom.png'), // Sua imagem
          ],
        ),
      ),
    );
  }
}