import 'package:flutter/material.dart';
import 'package:cpyd/services/google_service.dart'; //importar google service
import 'package:cpyd/services/reservas.dart'; //importar reservas

class FormsreserveInfo extends StatefulWidget {
  final Function(String, String) onSubmit;

  const FormsreserveInfo({super.key, required this.onSubmit});

  @override
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsreserveInfo> {
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController startController = TextEditingController();

  String? roomCodeValidator(String? value){
    if (value == null || value.isEmpty){
      return 'Ingrese el Código de Sala';
    }
    return null;
  }

  String? startValidator(String? value){
    if (value == null || value.isEmpty){
      return 'Ingrese el Inicio';
    }
    return null;
  }

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
            TextFormField(
              controller: roomCodeController,
              decoration: const InputDecoration(labelText: 'Código de Sala'),
              validator: roomCodeValidator,
            ),
            TextFormField(
              controller: startController,
              decoration: const InputDecoration(labelText: 'Inicio'),
              validator: startValidator,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                String start = startController.text;

                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode, start);
                String jwt = await GoogleService.getData('idToken');
                List<dynamic> respuesta = await ApiReserve.infoReserva(jwt, roomCode, start);

                // Mostrar el widget ReservasWidget después de enviar los datos
                // ignore: use_build_context_synchronously
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservasWidget(reservas: respuesta),
                  ),
                );*/
              },
              child: const Text('Enviar Datos'),
            ),
          ],
        ),
      ),
    );
  }
}
