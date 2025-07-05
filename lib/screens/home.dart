import 'package:app_paises/screens/city_peru.dart';
import 'package:flutter/material.dart';
import 'package:app_paises/screens/city_ecuador.dart';
import 'package:app_paises/screens/city_colombia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla de Países',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Países'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Botón Ecuador
            Expanded(
              child: SizedBox.expand(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EcuadorScreen()),
                    );
                  },
                  child: const Text(
                    'Ecuador',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ),
            // Botón Perú
            Expanded(
              child: SizedBox.expand(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PeruScreen()),
                    );
                  },
                  child: const Text(
                    'Perú',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ),
            // Botón Colombia
            Expanded(
              child: SizedBox.expand(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ColombiaScreen()),
                    );
                  },
                  child: const Text(
                    'Colombia',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
