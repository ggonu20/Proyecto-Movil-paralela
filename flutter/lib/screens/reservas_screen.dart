// reservas_screen.dart

import 'package:flutter/material.dart';
import 'package:cpyd/forms/reserveSearch_forms.dart'; //importa forms
import 'package:cpyd/forms/reserveRequest_forms.dart'; //importa forms
import 'package:cpyd/forms/reserveInfo_forms.dart'; //importa forms para infoReserva()
import 'package:cpyd/forms/reserveCancel_form.dart'; //importa forms para reserveCancel()


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
                  //Buscar reservas /booking/v1/reserve/search
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormsreserveSearch(
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
            
            const SizedBox(height: 16), //espacio
                  //Crear reserva /v1/reserve/request
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormsreserveRequest(
                            onSubmit: (roomCode, date, start, quantity) async{
                            },
                          )
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(71, 123, 212, 126), 
                    ),
                    child: const Text('Crear Reserva'),
                  ),
            const SizedBox(height: 16),
                  //Info reserva /v1/reserve/$roomCode/schedule/$isoDate
                  ElevatedButton(
                    onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormsreserveInfo(
                                onSubmit: (roomCode, start) async{
                                },
                              )
                            ),
                          );
                        },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(70, 81, 55, 230), // Cambia el color de fondo del botón
                    ),
                    child: const Text('Buscar Reserva por codigo'),
                  ),
            const SizedBox(height: 16),
                  // Cancelar reserva /v1/reserve/$token/cancel
                  ElevatedButton(
                    onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReserveCancelForm(
                                onSubmit: (roomCode, bookingToken) async{
                                },
                              )
                            ),
                          );
                        },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(70, 206, 28, 28), // Cambia el color de fondo del botón
                    ),
                    child: const Text('Eliminar Reserva'),
                  ),
            const SizedBox(height: 16),
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
