bool _validateForm(String roomCode, String date, String start, String quantity) {
  // Realiza la validación de cada campo y muestra un mensaje de error si es necesario
  if (roomCode.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingrese el Room Code')),
    );
    return false;
  }

  if (date.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingrese la fecha')),
    );
    return false;
  }

  if (start.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingrese la hora de inicio')),
    );
    return false;
  }

  if (quantity.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingrese la cantidad')),
    );
    return false;
  }

  return true;
}
