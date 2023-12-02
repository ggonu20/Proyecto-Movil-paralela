import 'package:cpyd/screens/login_screen.dart'; //importar screen login
import 'package:cpyd/screens/reservas_screen.dart'; //importar screen reservas
import 'package:cpyd/screens/salas_screen.dart'; //importar screen salas

import 'package:cpyd/services/google_service.dart'; //importar google_services que tiene las funciones login(), getData(), disconnect()

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
                  espacio(), // Espacio entre la boton y boton
                      //Boton reservas_screen
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReservasScreen(),
                            ),);},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 110.0, vertical: 20.0), // Espaciado interno
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                          ),
                        ),
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
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0), // Espaciado interno
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                          ),
                        ),
                        child: const Text('Salas'),
                      ),
                    SizedBox(height: 300), // Espacio entre la boton y boton
                  //Boton desconectar
                      ElevatedButton(
                        onPressed: () {
                          GoogleService.disconnect();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        //estilo del botón
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 214, 149, 74),
                          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0), // Espaciado interno
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                          ),
                        ),
                        //texto y estilo de texto del botón
                        child: const Text('Desconectar de Google',
                        style: TextStyle(
                          color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.blue, // Puedes ajustar el color según tu diseño
            height: 60.0, // Ajusta la altura según tus necesidades
              child: const Column(
                children:[
                Text(
                  'Universidad Tecnológica Metropolitana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    height: 2.5,
                  ),
                ),
                Text(
                  '~ Grupo Epsilon ~',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    height: 1,
                  ),
                ),
                ],
              ),
          ),
      );
    }

  SizedBox espacio() => const SizedBox(height: 16);
}
