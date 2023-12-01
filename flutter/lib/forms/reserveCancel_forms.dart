import 'package:flutter/material.dart';
import 'package:cpyd/services/google_service.dart';
import 'package:cpyd/services/reservas.dart';

class ReserveCancelForm extends StatefulWidget {
  final Function(String, String) onSubmit;

  const ReserveCancelForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _ReserveCancelFormState createState() => _ReserveCancelFormState();
}

class _ReserveCancelFormState extends State<ReserveCancelForm> {
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController bookingTokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancelar Reserva'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: roomCodeController,
              decoration: const InputDecoration(labelText: 'Código de Sala'),
            ),
            TextField(
              controller: bookingTokenController,
              decoration: const InputDecoration(labelText: 'Token'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                String bookingToken = bookingTokenController.text;

                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode, bookingToken);

                String jwt = await GoogleService.getData('idToken');

                await ApiReserve.reserveCancel(jwt, bookingToken);

                // Mostrar el widget ReservasWidget después de enviar los datos
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservasWidget(reservas: respuesta),
                  ),
                );*/
              },
              child: const Text('Cancelar Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}

