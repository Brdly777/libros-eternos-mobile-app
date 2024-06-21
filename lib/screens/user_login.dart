import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libreria/widgets/custom_button.dart';
import 'package:libreria/widgets/custom_textfield.dart';
import 'user_registration.dart';
import 'password_recovery.dart';

class UserLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.menu_book_rounded, color: Colors.black),
            SizedBox(width: 12),
            Text(
              'LibrosEternos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              hintText: 'Ingresa tu Correo',
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              hintText: 'Ingresa tu Contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            CustomButton(
              text: 'Iniciar Sesión',
              onPressed: () {
                print('Formulario de login');
              },
            ),
            const SizedBox(height: 16.0), // Espacio entre los botones
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistration()),
                );
              },
              child: Text('Deseas registrarte?'),
            ),
            const SizedBox(height: 16.0), // Espacio entre los botones
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordRecovery()),
                );
              },
              child: Text('Recuperar contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}
