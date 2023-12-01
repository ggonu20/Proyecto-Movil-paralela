// reservas_screen.dart

import 'package:cpyd/widget/reservas_widget.dart';
import 'package:flutter/material.dart';
import 'package:cpyd/forms/reservas_forms.dart'; //importa forms
import 'package:cpyd/services/reservas.dart'; //importar reservas
import 'package:cpyd/services/google_service.dart'; //importar google service
import 'package:cpyd/widget/reservas_widget.dart'; //importar reservas widget

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({super.key});

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
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormsScreen(
                      onSubmit: (roomCode, bookingToken, date) async{
                      },
                    )
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(71, 123, 212, 126), 
              ),
              child: const Text('Buscar Reserva'),
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


/* reserveResearch()
Map<String, dynamic> requestBody = {
  'roomCode': 'tu_código_de_sala',
  'bookingToken': 'tu_booking_token',
  'date': 'tu_fecha',
};

List<dynamic> respuesta = await HttpRequests.reserveSearch(jwt, requestBody);
print('respuesta de búsqueda de reservas: $respuesta');
*/

/* reserveRequest()
ElevatedButton(
  onPressed: () async {
    // Obtener el token de autorización (JWT)
    String jwt = await GoogleService.getData('idToken');

    // Crear el mapa con los datos necesarios para la solicitud de reserva
    Map<String, dynamic> requestBody = {
      'roomCode': 'tu_código_de_sala',
      'bookingToken': 'tu_booking_token',
      'date': 'tu_fecha',
    };

    // Realizar la solicitud de reserva utilizando la función reserveRequest
    List<dynamic> respuesta = await HttpRequests.reserveRequest(jwt, requestBody);

    // Imprimir la respuesta o realizar otras acciones según tus necesidades
    print('respuesta de solicitud de reserva: $respuesta');
  },
  child: Text('Solicitar Reserva'),
),
*/

/* infoReserva()
ElevatedButton(
  onPressed: () async {
    // Obtener el token de autorización (JWT)
    String jwt = await GoogleService.getData('idToken');

    // Proporcionar roomCode e isoDate según tus necesidades
    String roomCode = 'tu_código_de_sala';
    String isoDate = 'tu_fecha';

    // Realizar la solicitud de información de reserva utilizando la función infoReserva
    List<dynamic> respuesta = await HttpRequests.infoReserva(roomCode, isoDate, jwt);

    // Imprimir la respuesta o realizar otras acciones según tus necesidades
    print('respuesta de información de reserva: $respuesta');
  },
  child: Text('Obtener Información de Reserva'),
),
*/

/* reserveCancel()
ElevatedButton(
  onPressed: () async {
    // Obtener el token de autorización (JWT)
    String jwt = await GoogleService.getData('idToken');

    // Proporcionar el token según tus necesidades
    String token = 'tu_token_de_reserva';

    // Realizar la cancelación de reserva utilizando la función reserveCancel
    await HttpRequests.reserveCancel(token, jwt);

    // Imprimir un mensaje o realizar otras acciones según tus necesidades
    print('Reserva cancelada con éxito');
  },
  child: Text('Cancelar Reserva'),
),
*/
