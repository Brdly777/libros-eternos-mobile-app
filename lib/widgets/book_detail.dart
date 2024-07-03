import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final String title;
  final String fechaPrestamo;
  final String fechaDevolucion;
  final String estado;
  final String descripcion;

  const BookDetail({
    required this.title,
    required this.fechaPrestamo,
    required this.fechaDevolucion,
    required this.estado,
    required this.descripcion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Image.asset(
              '../assets/img/libroMujercitas.jpg',
              height: 250,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'Descripción:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              descripcion,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
