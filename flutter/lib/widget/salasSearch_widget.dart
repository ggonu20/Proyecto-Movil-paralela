import 'package:flutter/material.dart';

class SalasSWidget extends StatelessWidget {
  final Map<String, dynamic> sala;

  const SalasSWidget({super.key, required this.sala});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sala encontrada'),
      ),
      body: ListView.builder(
        itemCount: sala.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Sala ${sala["name"]}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text('Codigo ${sala["code"]}'),
                Text('Ubicación: ${sala["location"] ?? "No especificada"}'),
                Text('Nombre: ${sala["name"] ?? "No especificada"}'),
                Text('Capacidad: ${sala["capacity"] ?? "No especificada"}'),
                ],
            ),
          ),
        );
      },
    ),
  );
}
}