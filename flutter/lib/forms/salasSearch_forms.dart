import 'package:flutter/material.dart';
import 'package:cpyd/services/google_service.dart';
import 'package:cpyd/services/salas.dart';
import 'package:cpyd/widget/salasSearch_widget.dart';

class SalasSearchForm extends StatefulWidget {
  final Function(String) onSubmit;

  const SalasSearchForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _SalasSearchFormState createState() => _SalasSearchFormState();
}

class _SalasSearchFormState extends State<SalasSearchForm> {
  final TextEditingController roomCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Sala por Código'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: roomCodeController,
              decoration: const InputDecoration(labelText: 'Código de Sala', helperText: 'Ejemplo: B01'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode);
                
                String jwt = await GoogleService.getData('idToken');
                Map<String, dynamic> respuesta = await ApiSalas.obtenerSalasCodigo(jwt, roomCode);
                //print('Salas obtenidas: $respuesta');

                //Mostrar el widget SalasWidget después de enviar los datos
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalasSWidget(sala: respuesta),
                  ),
                );
              },
              child: const Text('Buscar Sala'),
            ),
          ],
        ),
      ),
    );
  }
}
