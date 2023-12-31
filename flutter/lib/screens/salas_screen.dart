import 'package:flutter/material.dart';
import 'package:cpyd/services/salas.dart';// importar rooms que tiene las funciones obtenerSalas(String jwt) async, 
import 'package:cpyd/services/google_service.dart'; //importar google_services que tiene las funciones login(), getData(), disconnect()
import 'package:cpyd/widget/mostrarSalas_widget.dart';
import 'package:cpyd/forms/salasSearch_forms.dart'; //importa fomrs para obtenerSalasCodigo()

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
                  onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SalasSearchForm(
                                onSubmit: (roomCode) async{
                                  
                                },
                              )
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(70, 81, 55, 230), // Cambia el color de fondo del botón
                    padding: EdgeInsets.symmetric(horizontal: 75.0, vertical: 20.0), // Espaciado interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                      ),
                  ),
                  child: const Text('Buscar Sala por Código',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ),
          const SizedBox(height: 50), //espacio
                ElevatedButton(
                  onPressed: () async {
                      String jwt = await GoogleService.getData('idToken');
                      List<dynamic> respuesta = await ApiSalas.obtenerSalas(jwt);
                        if (respuesta.isNotEmpty) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MostrarSalasWidget(salas: respuesta),
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
                    padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0), // Espaciado interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                      ),
                  ),
                  child: const Text('Mostrar Salas',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ),
          const SizedBox(height: 16), //espacio
          ]
      ),
    ),
    );
  }
}