import 'package:flutter/material.dart';
import 'package:cpyd/widget/reservas_widget.dart'; //importar reservas widget
import 'package:cpyd/services/google_service.dart'; //importar google service
import 'package:cpyd/services/reservas.dart'; //importar reservas

class FormsreserveSearch extends StatefulWidget {
  final Function(String, String, String) onSubmit;

  const FormsreserveSearch({super.key, required this.onSubmit});

  @override
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsreserveSearch> {
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
              decoration: const InputDecoration(labelText: 'Código de Sala', helperText: 'Ejemplo: R01'),
            ),
            TextField(
              controller: bookingTokenController,
              decoration: const InputDecoration(labelText: 'Token', helperText: 'Ejemplo: 04970361-579d-47a1-bef5-efb7fd89d749'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Fecha', helperText: 'Ejemplo: 2023-12-01'),
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
