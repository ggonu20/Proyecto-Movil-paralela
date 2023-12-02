import 'package:flutter/material.dart';
import 'package:cpyd/services/google_service.dart'; //importamos los datos de google del usuario
import 'package:cpyd/services/salas.dart'; //importar funciones de servicio
import 'package:cpyd/widget/salasSearch_widget.dart'; //importamos el widget

class SalasSearchForm extends StatefulWidget {
  final Function(String) onSubmit;

  const SalasSearchForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _SalasSearchFormState createState() => _SalasSearchFormState();
}

class _SalasSearchFormState extends State<SalasSearchForm> {
  final TextEditingController roomCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Funcion validadora de codigo de sala
  String? roomCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el Código de Sala';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Sala por Código'),
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
                    labelText: 'Código de Sala', helperText: 'Ejemplo: B01'),
                validator: roomCodeValidator,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String roomCode = roomCodeController.text;
                    widget.onSubmit(roomCode);

                    String jwt = await GoogleService.getData('idToken');
                    Map<String, dynamic> respuesta =
                        await ApiSalas.obtenerSalasCodigo(jwt, roomCode);
                    if (respuesta.isNotEmpty) {
                      //Mostrar el widget SalasWidget después de enviar los datos
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SalasSWidget(sala: respuesta),
                        ),
                      );
                    } else {
                      // Hubo un error en la reserva, mostrar un mensaje de error
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title:
                                const Text('Error al consultar la sala'),
                            content: const Text(
                                'Hubo un error al consultar la sala. Inténtelo de nuevo.'),
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
                child: const Text('Buscar Sala'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
