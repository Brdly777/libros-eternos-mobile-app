import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_notifier.dart';
import 'book_list.dart';
import '../widgets/book_detail.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    BookList(), // Usa el BookList como una de las opciones de navegación
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Esto oculta la flecha de regreso
        title: Stack(
          children: [
            Row(
              children: [
                Icon(
                  Icons.home_rounded,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 12),
                Text(
                  'Inicio',
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Prestamos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      '../assets/img/libroMujercitas.jpg',
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mujercitas',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Divider(),
                          const Text('Autor'),
                          const Text('Novela literaria'),
                          const SizedBox(height: 60),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                _showBookDetail(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_outline),
                                  SizedBox(width: 8),
                                  Text('Ver más'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showBookDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const BookDetail(
          title: 'Mujercitas',
          fechaPrestamo: '19/06/2024',
          fechaDevolucion: '20/06/2024',
          estado: 'Vencido',
          descripcion:
              'Mujercitas es una novela escrita por Louisa May Alcott y publicada en 1868. La historia sigue la vida de las hermanas March, Jo, Meg, Beth y Amy, y su viaje hacia la madurez.',
        );
      },
    );
  }
}
