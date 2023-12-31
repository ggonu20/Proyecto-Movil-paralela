import 'package:flutter/material.dart';
import 'package:cpyd/services/google_service.dart';
import 'package:cpyd/services/reservas.dart';
import 'package:cpyd/widget/reserveCancel_widget.dart';

class ReserveCancelForm extends StatefulWidget {
  final Function(String) onSubmit;

  const ReserveCancelForm({super.key, required this.onSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _ReserveCancelFormState createState() => _ReserveCancelFormState();
}

class _ReserveCancelFormState extends State<ReserveCancelForm> {
  final TextEditingController tokenController = TextEditingController();

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
              controller: tokenController,
              decoration: const InputDecoration(
                  labelText: 'Token',
                  helperText: 'Ejemplo: 04970361-579d-47a1-bef5-efb7fd89d749'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String token = tokenController.text;
                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(token);
                //Extraemos el jwt desde la informacion de contacto
                String jwt = await GoogleService.getData('idToken');
                //Llamamos a la funcion bool de reserveCancel() que nos devuelve true si la reserva se ha podido cancelar y sino
                bool isCancellationSuccessful = await ApiReserve.reserveCancel(jwt, token);
                //Mandamos a llamar al widget de cancelar reserva
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (context) => ReserveCWidget(isSuccess: isCancellationSuccessful)
                    )
                    );
              },
              child: const Text('Cancelar Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}
