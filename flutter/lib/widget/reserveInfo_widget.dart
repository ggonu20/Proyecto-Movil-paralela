import 'package:flutter/material.dart';

class ReserveIWidget extends StatelessWidget {
  final List<dynamic> reservas;

  const ReserveIWidget({super.key, required this.reservas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas encontradas'),
      ),
      //Creamos una funcion listView que construira todas las reservas encontradas para ese dia y las imprime en cards
      body: ListView.builder(
        itemCount: reservas.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> sala = reservas[index];
          return Card(
            child: ListTile(
              title: Text('Codigo ${sala["roomCode"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Token: ${sala["token"] ?? "No especificada"}'),
                  Text('Email: ${sala["userEmail"] ?? "No especificada"}'),
                  Text('Inicio: ${sala["start"] ?? "No especificada"}'),
                  Text('Fin: ${sala["end"] ?? "No especificada"}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
