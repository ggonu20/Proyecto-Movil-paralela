import 'package:flutter/material.dart';

class ReservasWidget extends StatelessWidget {
  final List<dynamic> reservas;

  const ReservasWidget({super.key, required this.reservas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas Disponibles'),
      ),
      //Creamos un listview builder que nos construira el list que recibimos
      body: ListView.builder(
        itemCount: reservas.length,
        itemBuilder: (context, index) {
          //mapeamos la respuesta que recibimos para mostrar
          Map<String, dynamic> reser = reservas[index];
          return Card(
            child: ListTile(
              title: Text('Sala: ${reser["roomCode"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Token: ${reser["token"] ?? "No especificada"}'),
                  Text('Correo: ${reser["userEmail"] ?? "No especificada"}'),
                  Text('Inicio: ${reser["start"] ?? "No especificada"}'),
                  Text('Final: ${reser["end"] ?? "No especificada"}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
