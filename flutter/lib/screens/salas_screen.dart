import 'package:flutter/material.dart';

class SalasScreen extends StatelessWidget {
  const SalasScreen({super.key});

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