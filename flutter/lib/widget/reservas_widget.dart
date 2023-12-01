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
      
      body: ListView.builder(
        itemCount: reservas.length,
        itemBuilder: (context, index) {
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
                    // Otros detalles según sea necesario
                  ],
                ),
                // Agregar aquí cualquier otra información que desees mostrar
              ),
            );
        },
      ),
    );
  }
}
