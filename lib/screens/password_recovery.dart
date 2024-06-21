import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libreria/widgets/custom_button.dart';
import 'package:libreria/widgets/custom_textfield.dart';

class PasswordRecovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.lock_reset, color: Colors.black),
            SizedBox(width: 12),
            Text(
              'Recuperar Contraseña',
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
            const SizedBox(height: 32.0),
            CustomButton(
              text: 'Enviar Link de Reinicio',
              onPressed: () {
                print('Enviar link de reinicio de contraseña');
              },
            ),
          ],
        ),
      ),
    );
  }
}
