import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class HttpRequests {
  static const String url = "https://api.sebastian.cl";
  static const String var1 = "application/json";
  static final Logger _logger = Logger();

        //Funcion obtener salas
         static Future<List<dynamic>> obtenerSalas(String jwt) async {
            Uri url_ = Uri.parse('$url/booking/v1/rooms/');

            Map<String, String> headers = {
              'accept': var1,
              'Content-Type': var1,
              'Authorization': "Bearer $jwt",
            };

            try {
              final response = await http.get(url_, headers: headers);
              _logger.d(json.decode(response.body));
              return json.decode(response.body);
            } catch (error) {
              _logger.e('Error al obtener salas: $error');
              // Devolver un mapa vacío en caso de error, puedes ajustarlo según tu lógica
              return [];
            }
          }
}