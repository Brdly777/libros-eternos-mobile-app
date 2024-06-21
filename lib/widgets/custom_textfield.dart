import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Icon? suffixIcon;

  const CustomTextField({
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      cursorColor: Colors.blue, // Color del cursor parpadeante
      style: TextStyle(color: Colors.black), // Color del texto
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // Color del borde cuando no está enfocado
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Color del borde cuando está enfocado
            width: 2.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey), // Color del hint
        suffixIcon: suffixIcon,
      ),
    );
  }
}
