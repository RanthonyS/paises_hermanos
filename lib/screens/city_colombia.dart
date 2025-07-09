import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ColombiaScreen extends StatefulWidget {
  const ColombiaScreen({super.key});

  @override
  State<ColombiaScreen> createState() => _ColombiaScreenState();
}

class _ColombiaScreenState extends State<ColombiaScreen> {
  String ciudad_name = "";
  String link_bandera = "";
  String link_escudo = "";
  int link_poblacion = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/colombia");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var flag = data[0]['flags']['png'];
      var coatOfArms = data[0]['coatOfArms']['png'];
      var population = data[0]['population'];

      print(flag);
      print(coatOfArms);
      print(population);

      setState(() {
        link_bandera = flag;
        link_escudo = coatOfArms;
        link_poblacion = population;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bandera de Colombia"),
          if (link_bandera.isNotEmpty)
            SizedBox(
              width: 200,
              height: 120,
              child: Image.network(link_bandera, fit: BoxFit.cover),
            ),
          const SizedBox(height: 20),
          const Text("Escudo de Colombia"),
          if (link_escudo.isNotEmpty)
            SizedBox(
              width: 150,
              height: 150,
              child: Image.network(link_escudo, fit: BoxFit.contain),
            ),
          const SizedBox(height: 20),
          Text("Población: ${link_poblacion.toString()}"),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              getData();
            },
            child: const Text("Cargar"),
          )
        ],
      ),
    );
  }
}
