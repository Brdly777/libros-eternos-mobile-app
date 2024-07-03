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
            imageUrl: '../assets/img/laMilyUnNoches.jpg',
            conRetraso: true,
          ),
          BookCard(
            title: '1984',
            fechaPrestamo: '19/06/2024',
            fechaDevolucion: '20/06/2024',
            estado: 'Vencido',
            descripcion: 'Buen libro',
            imageUrl: '../assets/img/1984.jpg',
            conRetraso: false,
          ),
          BookCard(
            title: 'Orgullo y prejuicio',
            fechaPrestamo: '19/06/2024',
            fechaDevolucion: '20/06/2024',
            estado: 'Vencido',
            descripcion: 'Buen libro',
            imageUrl: '../assets/img/OrgulloyPrejuicio.jpg',
            conRetraso: true,
          ),
          BookCard(
            title: 'Harry Potter y el misterio del príncipe',
            fechaPrestamo: '19/06/2024',
            fechaDevolucion: '20/06/2024',
            estado: 'Vencido',
            descripcion: 'Buen libro',
            imageUrl: '../assets/img/HarryPotter.jpg',
            conRetraso: false,
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
  final String imageUrl;
  final bool conRetraso;

  const BookCard({
    required this.title,
    required this.fechaPrestamo,
    required this.fechaDevolucion,
    required this.estado,
    required this.descripcion,
    required this.imageUrl,
    required this.conRetraso,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
            const SizedBox(width: 10.0),
            GestureDetector(
              onTap: conRetraso
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Incidencias'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // Agrega la acción que deseas para el botón 1
                                  },
                                  child: Text('Perdido'),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // Agrega la acción que deseas para el botón 2
                                  },
                                  child: Text('Entregado'),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cerrar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
              child: Stack(
                children: [
                  Image.asset(
                    imageUrl,
                    height: 150,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  if (conRetraso)
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.white70,
                        width: 100.0,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: const Text(
                          'Se entrega con retraso',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
