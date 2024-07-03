// profile.dart

// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user_login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Column(
            children: [
              Card(
                margin:  EdgeInsets.symmetric(vertical: 5.0),
                child: Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.person),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Usuario',
                            style:  TextStyle(
                              fontSize: 12
                            ),
                            ),
                          Text(
                            'John Doe',
                            style:  TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ),
              Card(
                margin:  EdgeInsets.symmetric(vertical: 5.0),
                child: Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.edit),
                      ),
                      Text(
                        'Cambiar nombre',
                        style:  TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Card(
                margin:  EdgeInsets.symmetric(vertical: 5.0),
                child: Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.lock),
                      ),
                      Text(
                        'Cambiar contraseña',
                        style:  TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Logout
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => UserLogin()),
                (route) => false,
              );
            },
            style: ButtonStyle(
              // ignore: deprecated_member_use
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blue), // Color de fondo del botón
              foregroundColor: WidgetStateProperty.all<Color>(
                  Colors.white), // Color del texto del botón
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            child: const Padding(
              padding:  EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.logout),
                  ),
                  Text(
                    'Cerrar sesión',
                    style:  TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      )
    );
  }
}