// reservas_screen.dart

import 'package:cpyd/services/reservas.dart';
import 'package:cpyd/widget/reserveCancel_widget.dart';
import 'package:flutter/material.dart';
import 'package:cpyd/forms/reserveSearch_forms.dart'; //importa forms
import 'package:cpyd/forms/reserveRequest_forms.dart'; //importa forms
import 'package:cpyd/forms/reserveInfo_forms.dart'; //importa forms para infoReserva()
import 'package:cpyd/forms/reserveCancel_forms.dart'; //importa forms para reserveCancel()
import 'package:cpyd/services/google_service.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Reservas'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //Buscar reservas /booking/v1/reserve/search
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormsreserveSearch(
                          onSubmit: (roomCode, bookingToken, date) async {},
                        )),
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
                          onSubmit: (roomCode, date, start, quantity) async {},
                        )),
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
                          onSubmit: (roomCode, start) async {},
                        )),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(
                  70, 81, 55, 230), // Cambia el color de fondo del botón
            ),
            child: const Text('Buscar Reserva por codigo'),
          ),
          const SizedBox(height: 16),
          // Cancelar reserva /v1/reserve/$token/cancel
          ElevatedButton(
            onPressed: () async {
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReserveCancelForm(
                          onSubmit: (token) async { },
                        )),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(
                  70, 206, 28, 28), // Cambia el color de fondo del botón
            ),
            child: const Text('Eliminar Reserva'),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}