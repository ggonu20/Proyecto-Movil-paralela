import 'package:flutter/material.dart';

class SalasSWidget extends StatelessWidget {
  final Map<String, dynamic> sala;

  const SalasSWidget({Key? key, required this.sala}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sala encontrada'),
      ),
      body: Card(
        child: ListTile(
          title: Text('Código ${sala["code"]}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Codigo ${sala["code"]}'),
              Text('Ubicación: ${sala["location"] ?? "No especificada"}'),
              Text('Nombre: ${sala["name"] ?? "No especificada"}'),
              Text('Capacidad: ${sala["capacity"] ?? "No especificada"}'),
            ],
          ),
        ),
      ),
    );
  }
}
