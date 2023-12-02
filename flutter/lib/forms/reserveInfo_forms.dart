import 'package:flutter/material.dart';
import 'package:cpyd/services/google_service.dart'; //importar google service
import 'package:cpyd/services/reservas.dart'; //importar funciones de reservas
import 'package:cpyd/widget/reserveInfo_widget.dart'; //importa el widget de reserveInfo

class FormsreserveInfo extends StatefulWidget {
  final Function(String, String) onSubmit;

  const FormsreserveInfo({super.key, required this.onSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsreserveInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  //Funcion validadora para roomCode
  String? roomCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el Código de Sala';
    }
    return null;
  }

  //Funcion validadora para start (fecha)
  String? startValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el Inicio';
    }
    RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegExp.hasMatch(value)) {
      return 'Formato de fecha inválido. Use yyyy-mm-dd';
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: roomCodeController,
                decoration: const InputDecoration(
                    labelText: 'Código de Sala', helperText: 'Ejemplo: R01'),
                validator: roomCodeValidator,
              ),
              TextFormField(
                controller: startController,
                decoration: const InputDecoration(
                    labelText: 'Fecha', helperText: 'Ejemplo: 2023-12-01'),
                validator: startValidator,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String roomCode = roomCodeController.text;
                    String start = startController.text;
                    // Llamada a la función onSubmit del widget padre
                    widget.onSubmit(roomCode, start);

                    String jwt = await GoogleService.getData('idToken');
                    List<dynamic> respuesta =
                        await ApiReserve.infoReserva(jwt, roomCode, start);
                    if (respuesta.isNotEmpty) {
                      // Mostrar el widget ReservasWidget después de enviar los datos
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ReserveIWidget(reservas: respuesta),
                        ),
                      );
                    } else {
                      // Hubo un error en la reserva, mostrar un mensaje de error
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error en la consulta'),
                            content: const Text(
                                'Hubo un error al consultar la reserva. Inténtelo de nuevo.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: const Text('Enviar Datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
