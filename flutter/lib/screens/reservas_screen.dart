// reservas_screen.dart

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalasScreen(),
                  ),
                );
              },
              child: Text('Ver Salas'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Reservas"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MisReservasScreen(),
                  ),
                );
              },
              child: Text('Mis Reservas'),
            ),
          ],
        ),
      ),
    );
  }
}

class MisReservasScreen extends StatelessWidget {
  const MisReservasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Reservas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "buscar reserva"
                print('Buscar Reservas presionado');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(71, 123, 212, 126), 
              ),
              child: Text('Buscar Reserva'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Crear Reserva"
                print('Crear Reserva presionado');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(71, 123, 212, 126), 
              ),
              child: Text('Crear Reserva'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "buscar reserva por código"
                print('Buscar Reservas por codigo presionado');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(70, 81, 55, 230), // Cambia el color de fondo del botón
              ),
              child: Text('Buscar Reserva por codigo'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "eliminar reserva"
                print('Eliminar Reserva presionado');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(70, 206, 28, 28), // Cambia el color de fondo del botón
              ),
              child: Text('Eliminar Reserva'),
            ),
            SizedBox(height: 16),
            ]
      ),
    ),
    );
  }
}

class SalasScreen extends StatelessWidget {
  const SalasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "buscar sala por codigo"
                print('Buscar sala por codigo');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(70, 81, 55, 230), // Cambia el color de fondo del botón
              ),
              child: Text('Buscar sala por codigo'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Mostrar salas"
                print('Mostrar salas');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(70, 81, 55, 230), // Cambia el color de fondo del botón
              ),
              child: Text('Mostrar salas'),
            ),
            SizedBox(height: 16),
            ]
      ),
    ),
    );
  }
}
