import 'package:flutter/material.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({super.key});

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
                    print('Salas Disponibles presionado');
                  },
                  child: Text('Salas Disponibles'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar "Reservas"
                    print('Reservas presionado');
                  },
                  child: Text('Crear Reserva'),
                ),
              ],
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
