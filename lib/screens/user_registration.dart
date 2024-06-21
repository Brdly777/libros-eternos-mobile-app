import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libreria/widgets/custom_button.dart';
import 'package:libreria/widgets/custom_textfield.dart';

class UserRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.person_add, color: Colors.black),
            SizedBox(width: 12),
            Text(
              'Registro de Usuario',
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
              hintText: 'Nombre Completo',
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              hintText: 'Ingresa tu Correo',
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              hintText: 'Ingresa tu Contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              hintText: 'Confirma tu Contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            CustomButton(
              text: 'Registrar',
              onPressed: () {
                print('Formulario de registro');
              },
            ),
          ],
        ),
      ),
    );
  }
}
