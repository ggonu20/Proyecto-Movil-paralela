import 'package:flutter/material.dart';

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
        title: Text('Ingrese Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: roomCodeController,
              decoration: InputDecoration(labelText: 'Room Code'),
            ),
            TextField(
              controller: bookingTokenController,
              decoration: InputDecoration(labelText: 'Booking Token'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String roomCode = roomCodeController.text;
                String bookingToken = bookingTokenController.text;
                String date = dateController.text;

                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode, bookingToken, date);

                // Cerrar el formulario después de enviar los datos
                Navigator.pop(context);
              },
              child: Text('Enviar Datos'),
            ),
          ],
        ),
      ),
    );
  }
}
