import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeruScreen extends StatefulWidget {
  const PeruScreen({super.key});

  @override
  State<PeruScreen> createState() => _PeruScreenState();
}

class _PeruScreenState extends State<PeruScreen> {
  String ciudad_name = "";
  String link_bandera = "";
  String link_escudo = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/peru");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var flag = data[0]['flags']['png'];
      var coatOfArms = data[0]['coatOfArms']['png'];

      print(flag);
      print(coatOfArms);

      setState(() {
        link_bandera = flag;
        link_escudo = coatOfArms;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bandera de Peru"),
          if (link_bandera.isNotEmpty) Image.network(link_bandera),
          const SizedBox(height: 20),
          if (link_escudo.isNotEmpty) Image.network(link_escudo),
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
