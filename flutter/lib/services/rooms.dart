import 'package:http/http.dart' as http;

Future<void> hacerSolicitud() async {
  // Define el cliente HTTP una vez
  final http.Client client = http.Client();

  // URL base y endpoint
  final String baseUrl = 'https://api.sebastian.cl/booking';
  final String endpoint = '/v1/rooms/';

  // JWT de autorización
  final String jwtToken = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjBlNzJkYTFkZjUwMWNhNmY3NTZiZjEwM2ZkN2M3MjAyOTQ3NzI1MDYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIyMTIyNjc2ODY2MDQtMGo0a3M5c25pa2plMHNzdGpqbW10Mm1tZTJvZHYyZnUuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIyMTIyNjc2ODY2MDQtMGo0a3M5c25pa2plMHNzdGpqbW10Mm1tZTJvZHYyZnUuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTEzNTA0NjIzMDI2OTQzODA1ODAiLCJoZCI6InV0ZW0uY2wiLCJlbWFpbCI6ImcuZ29uemFsZXpuQHV0ZW0uY2wiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IkMxWm5vTWxlb0paSlMzelVmSGp3VWciLCJpYXQiOjE3MDEzNTgzNDIsImV4cCI6MTcwMTM2MTk0Mn0.kcJHLAru0M0UXjntniJTc0IwwKpYj0o7prvuDITtz5JjIeVQjVHB6RXAOs2vJedPxjqJIsdlnBoOzRJ4aUyiFFZ8FUv1NWpIPrNArifepaQ6bsaPxwdYxEeG6m97ikgRyPoskhs12M4zGfEbu_U3fzkn7STG4VaBdkCw0OoBfis5DP7RW8mgEeBOE7UPh74PxztveA7YUqHLa8qC0NY9EDytX70dAGlP9gx4teYZaoV2hh8qSoFcDNWKufTb5oA4M3M0DRtsBkri864vHntl-Ll6r2BHa3cbLUvUoYzwFKKoVUsi-VDDTRA_IcKRB9LCtd7IUDERYZEUUa-Ry0yYrA';  // Reemplaza con tu JWT real

  // Parámetros de consulta
  final Map<String, String> queryParams = {'q': '{http}'};

  // Construye la URL completa con parámetros de consulta
  final Uri uri = Uri.https(baseUrl, endpoint, queryParams);

  // Realiza la solicitud HTTP con el encabezado de autorización
  try {
    final http.Response response = await client.get(
      uri,
      headers: {'Authorization': 'Bearer $jwtToken'},
    );

    if (response.statusCode == 200) {
      print('Respuesta exitosa: ${response.body}');
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  } finally {
    // Asegúrate de cerrar el cliente HTTP cuando hayas terminado
    client.close();
  }
}

void main() {
  hacerSolicitud();
}
