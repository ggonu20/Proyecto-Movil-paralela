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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "Salas Disponibles"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalasScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                ),
                child: Text('Ver Salas'),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "Reservas"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MisReservasScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                ),
                child: Text('Mis Reservas'),
              ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "buscar reserva"
                  print('Buscar Reservas presionado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  primary: Color.fromARGB(70, 43, 206, 28),
                ),
                child: Text('Buscar Reserva'),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "Crear Reserva"
                  print('Crear Reserva presionado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  primary: Color.fromARGB(70, 43, 206, 28),
                ),
                child: Text('Crear Reserva'),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "buscar reserva por código"
                  print('Buscar Reservas por código presionado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  primary: Color.fromARGB(70, 40, 28, 206),
                ),
                child: Text('Buscar Reserva por código'),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "eliminar reserva"
                  print('Eliminar Reserva presionado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  primary: Color.fromARGB(70, 206, 28, 28), 
                ),
                child: Text('Eliminar Reserva'),
              ),
            ),
            SizedBox(height: 16),
          ],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "buscar sala por código"
                  print('Buscar sala por código');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  primary: Color.fromARGB(70, 40, 28, 206), 
                ),
                child: Text('Buscar sala por código'),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0), 
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar "Mostrar salas"
                  print('Mostrar salas');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  primary: Color.fromARGB(70, 40, 28, 206),
                ),
                child: Text('Mostrar salas'),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
