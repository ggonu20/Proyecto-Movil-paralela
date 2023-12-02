import 'package:flutter/material.dart';

class ReserveRWidget extends StatelessWidget {
  final List<dynamic> reservas;

  const ReserveRWidget({super.key, required this.reservas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva creada con exito'),
      ),
      //Crea un listview que mete en cards cada item en la lista
      body: ListView.builder(
        itemCount: reservas.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> sala = reservas[index];
          return Card(
            child: ListTile(
              title: Text('Sala: ${sala["roomCode"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Token de reserva: ${sala["token"] ?? "No especificada"}'),
                  Text('Mail: ${sala["userEmail"] ?? "No especificada"}'),
                  Text('Inicio: ${sala["start"] ?? "No especificada"}'),
                  Text('Termino: ${sala["end"] ?? "No especificada"}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
