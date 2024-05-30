import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String userName = 'Usuario Ejemplo'; // Nombre de usuario, puedes reemplazarlo con el nombre real del usuario

  final List<String> newsTitles = [
    'Título de la Noticia 1',
    'Título de la Noticia 2',
    'Título de la Noticia 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inicio',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Bienvenido, $userName!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Noticias',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: newsTitles.length,
                itemBuilder: (context, index) {
                  return _buildNewsItem(newsTitles[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/news_image.png'), // Aquí se carga la imagen de la noticia
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(), // Separador entre noticias
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
