// book_list.dart

import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          BookCard(
            title: 'Las Mil y una noche',
            fechaPrestamo: '19/06/2024',
            fechaDevolucion: '20/06/2024',
            estado: 'Vencido',
            descripcion: 'Buen libro',
          ),
          BookCard(
            title: '1984',
            fechaPrestamo: '19/06/2024',
            fechaDevolucion: '20/06/2024',
            estado: 'Vencido',
            descripcion: 'Buen libro',
          ),
          BookCard(
            title: 'Orgullo y prejuicio',
            fechaPrestamo: '19/06/2024',
            fechaDevolucion: '20/06/2024',
            estado: 'Vencido',
            descripcion: 'Buen libro',
          ),
          BookCard(
            title: 'Harry Potter y el misterio del principe',
            fechaPrestamo: '19/06/2024',
            fechaDevolucion: '20/06/2024',
            estado: 'Vencido',
            descripcion: 'Buen libro',
          ),
          // Agrega más BookCard según sea necesario
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String fechaPrestamo;
  final String fechaDevolucion;
  final String estado;
  final String descripcion;

  const BookCard({
    required this.title,
    required this.fechaPrestamo,
    required this.fechaDevolucion,
    required this.estado,
    required this.descripcion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text('Fecha de Préstamo: $fechaPrestamo'),
            Text('Fecha de Devolución: $fechaDevolucion'),
            Text('Estado: $estado'),
            const SizedBox(height: 5.0),
            Text('Descripción: $descripcion'),
          ],
        ),
      ),
    );
  }
}
