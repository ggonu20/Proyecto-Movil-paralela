import 'package:cpyd/screens/error_screen.dart';
import 'package:cpyd/screens/home_screen.dart';
import 'package:cpyd/services/google_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatelessWidget {
  static final Logger _logger = Logger();

  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30.0), 
                child: Image(
                  image: NetworkImage('https://www.redcampussustentable.cl/wp-content/uploads/2022/07/UTEM-PNG.png'),
                  width: 200.0,
                  height: 200.0,
                ),
              ),
              Text(
                'Reserva de Salas', 
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter'
                ),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                child: const Row(
                  children: [Icon(Icons.g_mobiledata), Text('Ingresar')],
                ),
                onPressed: () {
                  GoogleService.login().then((result) {
                    if (result) {
                      _logger.i("Perfecto");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      _logger.f("F");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ErrorScreen(),
                        ),
                      );
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

