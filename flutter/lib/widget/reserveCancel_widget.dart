// reserveCancel_widget.dart
import 'package:flutter/material.dart';

class ReserveCWidget extends StatelessWidget {
  final bool isSuccess;

  const ReserveCWidget({Key? key, required this.isSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
