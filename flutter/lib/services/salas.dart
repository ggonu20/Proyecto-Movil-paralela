import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class ApiSalas {
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
        
        //Funcion obtener salas por codigo
         static Future<Map<String, dynamic>> obtenerSalasCodigo(String jwt, String roomCode) async {
            Uri url_ = Uri.parse('$url/booking/v1/rooms/$roomCode');

            Map<String, String> headers = {
              'accept': var1,
              'Content-Type': var1,
              'Authorization': "Bearer $jwt",
            };

            try {
              final response = await http.get(url_, headers: headers);
              if (response.statusCode >= 200 && response.statusCode < 400) {
                _logger.d(json.decode(response.body));
                Map<String, dynamic> data = json.decode(response.body);
                return data;
              } else {
                _logger.e('Error al obtener la sala. Código de estado: ${response.statusCode}');
                return {};
              }
            } catch (error) {
              _logger.e('Error al obtener la sala: $error');
              return {};
            }
          }
}