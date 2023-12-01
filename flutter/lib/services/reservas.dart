import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class ApiReserve {
  static const String url = "https://api.sebastian.cl";
  static const String var1 = "application/json";
  static final Logger _logger = Logger();

        //Funcion post obtener reservas
         static Future<List<dynamic>> reserveSearch(String jwt, Map<String, dynamic> requestBody) async {
            Uri url_ = Uri.parse('$url/booking/v1/reserve/search');
            Map<String, String> headers = {
              'accept': var1,
              'Content-Type': var1,
              'Authorization': "Bearer $jwt",
            };

            try {
              final response = await http.post(url_, headers: headers, body: json.encode(requestBody));
              //_logger.d(json.decode(response.body));  //imprime la respuesta en pantalla
              return json.decode(response.body);
            } catch (error) {
              _logger.e('Error al realizar la busqueda de reserva: $error');
              // Devolver un mapa vacío en caso de error, puedes ajustarlo según tu lógica
              return [];
            }
          }

        //Funcion post pedir reserva 
         static Future<List<dynamic>> reserveRequest(String jwt, Map<String, dynamic> requestBody) async {
            Uri url_ = Uri.parse('$url/booking/v1/reserve/request');
            Map<String, String> headers = {
              'accept': var1,
              'Content-Type': var1,
              'Authorization': "Bearer $jwt",
            };

            try {
              final response = await http.post(url_, headers: headers, body: json.encode(requestBody));
              _logger.d(json.decode(response.body));
               if (response.statusCode >= 200 && response.statusCode < 400) {
                return json.decode(response.body);
                }else {
                _logger.e('Error al ingresar la reserva. Código de estado: ${response.statusCode}');
                return [];
              }
            } catch (error) {
              _logger.e('Error al ingresar la reserva: $error');
              // Devolver un mapa vacío en caso de error, puedes ajustarlo según tu lógica
              return [];
            }
          } 

      //Funcion get obetener datos reserva con roomCode y isoDate
        // cambiar toda la funcion
         static Future<List<dynamic>> infoReserva(String jwt, String roomCode, String isoDate) async {
            Uri url_ = Uri.parse('$url/booking/v1/reserve/$roomCode/schedule/$isoDate');
            Map<String, String> headers = {
              'accept': var1,
              'Content-Type': var1,
              'Authorization': "Bearer $jwt",
            };

            try {
              final response = await http.get(url_, headers: headers);
              _logger.d(json.decode(response.body));
              if (response.statusCode >= 200 && response.statusCode < 400) {
                return json.decode(response.body);
                }else {
                _logger.e('Error al ingresar la reserva. Código de estado: ${response.statusCode}');
                return [];
              }
            } catch (error) {
              _logger.e('Error al obtener salas: $error');
              // Devolver un mapa vacío en caso de error, puedes ajustarlo según tu lógica
              return [];
            }
          }

      //Funcion delete cancelar reserva con token
         static Future<bool> reserveCancel(String jwt, String token) async {
            Uri url_ = Uri.parse('$url/booking/v1/reserve/$token/cancel');
            Map<String, String> headers = {
              'accept': var1,
              'Content-Type': var1,
              'Authorization': "Bearer $jwt",
            };

            try {
              final response = await http.delete(url_, headers: headers);
              if (response.statusCode >= 200 && response.statusCode < 400) {
              _logger.i('Reserva cancelada exitosamente');
              return true;
              } else {
                _logger.e('Error al cancelar la reserva. Código de estado: ${response.statusCode}');
                return false;
              }
            } catch (error) {
              _logger.e('Error al cancelar la reserva: $error');
              return false;
            }
          }
}