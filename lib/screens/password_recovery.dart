import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:libreria/widgets/custom_button.dart';
import 'package:libreria/widgets/custom_textfield.dart';
import 'user_login.dart';
import '../theme_notifier.dart';

class PasswordRecovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Row(
              children: [
                Icon(
                  Icons.lock_reset_rounded,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                Text(
                  'Recuperación',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: -7,
              child: IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: () {
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 140),
            Container(
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 190),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Reiniciar contraseña",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 16.0),
                  const CustomTextField(
                    hintText: 'Ingresa tu Correo',
                    suffixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  CustomButton(
                    text: 'Enviar',
                    onPressed: () {
                      print('Formulario de login');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26.0),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
              child: const Text(
                'Ya tienes cuenta? Inicia sesión aquí',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
