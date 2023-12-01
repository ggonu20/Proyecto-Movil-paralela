import 'package:flutter/material.dart';
import 'package:cpyd/services/salas.dart';// importar rooms que tiene las funciones obtenerSalas(String jwt) async, 
import 'package:cpyd/services/google_service.dart'; //importar google_services que tiene las funciones login(), getData(), disconnect()
import 'package:cpyd/widget/salas_widget.dart';

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
                    primary: const Color.fromARGB(70, 81, 55, 230), // Cambia el color de fondo del botón
                  ),
                  child: const Text('Buscar sala por codigo'),
                ),
            const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                      String jwt = await GoogleService.getData('idToken');
                      List<dynamic> respuesta = await ApiSalas.obtenerSalas(jwt);
                        if (respuesta.isNotEmpty) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SalasWidget(salas: respuesta),
                            ),
                          );
                        } else {
                          // Puedes manejar el caso donde no se obtienen salas
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No se encontraron salas disponibles.'),
                            ),
                          );
                        }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(70, 81, 55, 230), // Cambia el color de fondo del botón
                  ),
                  child: const Text('Mostrar salas'),
                ),
            const SizedBox(height: 16),
            ]
      ),
    ),
    );
  }
}