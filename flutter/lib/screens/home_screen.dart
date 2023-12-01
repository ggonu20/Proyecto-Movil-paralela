import 'package:cpyd/screens/login_screen.dart'; //importar screen login
import 'package:cpyd/screens/reservas_screen.dart'; //importar screen reservas
import 'package:cpyd/screens/salas_screen.dart'; //importar screen salas

import 'package:cpyd/services/google_service.dart'; //importar google_services que tiene las funciones login(), getData(), disconnect()
import 'package:cpyd/services/salas.dart';// importar rooms que tiene las funciones obtenerSalas(String jwt) async, 

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';



class HomeScreen extends StatelessWidget {
  static final Logger _logger = Logger();

  const HomeScreen({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          //appBar de home_screen
          appBar: AppBar(
              title: FutureBuilder<String>(
                  future: GoogleService.getData('nombre'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text('${snapshot.data}');
                    } else if (snapshot.hasError) {
                      _logger.e('${snapshot.error}');
                      return const Text('Nombre');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
            ),
          //Body de home_screen
          body: Center(
            //Se crea una columna donde agregaremos todas las funciones y se alinea al centro
            child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      ClipOval(
                        child: FutureBuilder<String>(
                          future: GoogleService.getData('foto'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return Image.network('${snapshot.data}');
                            } else if (snapshot.hasError) {
                              return const Icon(Icons.error);
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                  espacio(), // Espacio entre la boton y boton
                      //Boton desconectar
                      ElevatedButton(
                        onPressed: () {
                          GoogleService.disconnect();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text('Desconectar Google'),
                      ),
                  espacio(), // Espacio entre la boton y boton
                      //Boton obtenerSalas prueba
                      ElevatedButton(
                        onPressed: () async {
                          String jwt = await GoogleService.getData('idToken');
                          List<dynamic> respuesta = await ApiSalas.obtenerSalas(jwt);
                          //print('respuesta de obtener salas : $respuesta');
                        },
                        child: const Text('obtenerSalas'),
                      ),
                  espacio(), // Espacio entre la boton y boton
                      //Boton reservas_screen
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReservasScreen(),
                            ),);},
                        child: const Text('Reservas'),
                      ),
                  espacio(), // Espacio entre la boton y boton
                      //Boton reservas_screen
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SalasScreen(),
                            ),);},
                        child: const Text('Salas'),
                      ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.blue, // Puedes ajustar el color según tu diseño
            height: 60.0, // Ajusta la altura según tus necesidades
              child: const Center(
                child:  Text(
                  'Este es el pie de página',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
          ),
      );
    }

  SizedBox espacio() => const SizedBox(height: 16);
}
