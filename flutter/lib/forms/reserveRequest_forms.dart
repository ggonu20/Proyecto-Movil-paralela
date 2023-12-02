import 'package:flutter/material.dart';
import 'package:cpyd/services/google_service.dart'; //importar google service
import 'package:cpyd/services/reservas.dart'; //importar reservas
import 'package:cpyd/widget/reserveRequest_widget.dart'; //import widget de respuesta

class FormsreserveRequest extends StatefulWidget {
  final Function(String, String, String, String) onSubmit;

  const FormsreserveRequest({super.key, required this.onSubmit});

  @override
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsreserveRequest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String? roomCodeValidator(String? value){
    if (value == null || value.isEmpty){
      return 'Ingrese el Código de Sala';
    }
    return null;
  }

  String? dateValidator(String? value){
    if (value == null || value.isEmpty){
      return 'Ingrese la fecha';
    }
    RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegExp.hasMatch(value)) {
    return 'Formato de fecha inválido. Use yyyy-mm-dd';
  }
    return null;
  }

  String? startValidator(String? value){
    if (value == null || value.isEmpty){
      return 'Ingrese el inicio';
    }
    RegExp dateRegExp = RegExp(r'^\d{2}:\d{2}:\d{2}$');
    if (!dateRegExp.hasMatch(value)) {
    return 'Formato de fecha inválido. Use hh:mm:ss';
    } 
    return null;
  }

  String? quantityValidator(String? value){
    if (value == null || value.isEmpty){
      return 'Ingrese la Cantidad';
    }
    final RegExp regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value)) {
    return 'La Cantidad debe contener solo números';
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
                decoration: const InputDecoration(labelText: 'Código de Sala', helperText: 'Ejemplo: R01'),
                validator: roomCodeValidator,
              ),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Fecha', helperText: 'Ejemplo: 2023-12-01'),
                validator: dateValidator,
              ),
              TextFormField(
                controller: startController,
                decoration: const InputDecoration(labelText: 'Inicio', helperText: 'Ejemplo: 17:00:00'),
                validator: startValidator,
              ),
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Cantidad', helperText: 'Ejemplo: 1'),
                validator: quantityValidator,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String roomCode = roomCodeController.text;
                    String date = dateController.text;
                    String start = startController.text;
                    String quantity = quantityController.text;

                    // Llamada a la función onSubmit del widget padre
                    widget.onSubmit(roomCode, date, start, quantity);
                    String jwt = await GoogleService.getData('idToken');
                    //mapeamos el requestBody con los datos que sacamos del formulario
                    Map<String, dynamic> requestBody = {
                      'roomCode': roomCode,
                      'date': date,
                      'start': start,
                      "quantity": quantity,
                    };
                    List<dynamic> respuesta = await ApiReserve.reserveRequest(jwt, requestBody);
                    if (respuesta.isNotEmpty){
                      // Mostrar el widget de respuesta con exito
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReserveRWidget(reservas: respuesta),
                      ),);
                    } else {
                      // Hubo un error en la reserva, mostrar un mensaje de error
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error en la reserva'),
                            content: const Text('Hubo un error al realizar la reserva. Inténtelo de nuevo.'),
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
