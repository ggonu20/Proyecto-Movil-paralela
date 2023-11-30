import 'dart:io';

import 'package:cpyd/screens/login_screen.dart';
import 'package:cpyd/services/google_service.dart';
import 'package:cpyd/screens/reservas_screen.dart';
import 'package:cpyd/services/rooms.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';



class HomeScreen extends StatelessWidget {
  static final Logger _logger = Logger();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                })),
        body: Center(
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
              SizedBox(height: 16), // Espacio entre la imagen y el botón
              ElevatedButton(
                onPressed: () {
                  print('Botón presionado');
                  GoogleService.disconnect();
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Text('Desconectar Google'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  String jwt = await GoogleService.getData('idToken');
                  List<dynamic> respuesta = await HttpRequests.obtenerSalas(jwt);
                  //print('respuesta de obtener salas : $respuesta');
                },
                child: Text('obtenerSalas'),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                // Acción al presionar "Reservas"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReservasScreen(),
                  ),
                );
              },

                child: Text('Reservas'),
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
        ),);
  }
}
