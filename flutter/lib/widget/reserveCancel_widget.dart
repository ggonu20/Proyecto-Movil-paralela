// reserveCancel_widget.dart
import 'package:flutter/material.dart';

class ReserveCWidget extends StatelessWidget {
  final bool isSuccess;

  const ReserveCWidget({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Preguntamos si isSucces es true o false, para cada caso se crea un titulo distinto
        title: isSuccess ? const Text('Reserva Cancelada') : const Text('Error al Cancelar Reserva'),
      ),
      body: Center(
        child: isSuccess
            ? const Text('La reserva ha sido cancelada exitosamente.')
            : const Text('Hubo un error al intentar cancelar la reserva.'),
      ),
    );
  }
}
