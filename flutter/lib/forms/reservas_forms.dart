import 'package:flutter/material.dart';
import 'package:cpyd/widget/reservas_widget.dart'; //importar reservas widget
import 'package:cpyd/services/google_service.dart'; //importar google service
import 'package:cpyd/services/reservas.dart'; //importar reservas

class FormsScreen extends StatefulWidget {
  final Function(String, String, String) onSubmit;

  const FormsScreen({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController bookingTokenController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingrese Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: roomCodeController,
              decoration: const InputDecoration(labelText: 'Room Code'),
            ),
            TextField(
              controller: bookingTokenController,
              decoration: const InputDecoration(labelText: 'Booking Token'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Date'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                String bookingToken = bookingTokenController.text;
                String date = dateController.text;

                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode, bookingToken, date);
                String jwt = await GoogleService.getData('idToken');
                            //mapeamos el requestBody con los datos que sacamos del formulario
                            Map<String, dynamic> requestBody = {
                              'roomCode': roomCode,
                              'bookingToken': bookingToken,
                              'date': date,
                            };
                List<dynamic> respuesta = await ApiReserve.reserveSearch(jwt, requestBody);

                // Mostrar el widget ReservasWidget después de enviar los datos
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservasWidget(reservas: respuesta),
                  ),
                );
              },
              child: const Text('Enviar Datos'),
            ),
          ],
        ),
      ),
    );
  }
}
