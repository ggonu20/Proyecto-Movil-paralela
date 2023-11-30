import 'package:flutter/material.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Salas Disponibles"
                print('Salas Disponibles presionado');
              },
              child: Text('Salas Disponibles'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Reservas"
                print('Reservas presionado');
              },
              child: Text('Crear Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}
