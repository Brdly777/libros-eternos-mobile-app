import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_notifier.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'user_registration.dart';
import 'password_recovery.dart';
import 'home.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    color: theme.iconTheme.color,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Libros',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  Text(
                    'Eternos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
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
            const SizedBox(height: 77),
            Container(
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 300),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[900] : Colors.white,
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
                  Text(
                    "Iniciar sesión",
                    style: TextStyle(
                      fontSize: 20,
                      color: theme.textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    color: theme.primaryColor,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    hintText: 'Ingresa tu Correo',
                    suffixIcon: Icon(
                      Icons.email,
                      color: theme.iconTheme.color,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    hintText: 'Ingresa tu Contraseña',
                    obscureText: true,
                    suffixIcon: Icon(
                      Icons.lock,
                      color: theme.iconTheme.color,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (newValue) {
                          setState(() {
                            _rememberMe = newValue!;
                          });
                        },
                        activeColor: theme.primaryColor,
                      ),
                      Text(
                        "Recuérdame",
                        style: TextStyle(
                          color: theme.textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  CustomButton(
                    text: 'Entrar',
                    onPressed: () {
                      // Navegar a la pantalla Home al presionar el botón
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistration()),
                );
              },
              child: Text(
                'No tienes cuenta? Regístrate aquí',
                style: TextStyle(
                  color: theme.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 6.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordRecovery()),
                );
              },
              child: Text(
                'Recuperar contraseña',
                style: TextStyle(
                  color: theme.primaryColor,
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
