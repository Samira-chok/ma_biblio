import 'package:flutter/material.dart';
import 'screens/parametres_screen.dart';
import 'screens/catalogue_screen.dart';
import 'screens/galerie_screen.dart';
import 'screens/ma_liste_screen.dart';

void main() {
  runApp(const MaBiblioApp());
}

class MaBiblioApp extends StatelessWidget {
  const MaBiblioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaBiblio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index de l'onglet actif (0: Catalogue, 1: Galerie, 2: Ma liste)
  int _currentIndex = 0;

  // Titres correspondants à chaque onglet dans l'AppBar
  final List<String> _titres = const [
    'Catalogue',
    'Galerie',
    'Ma liste de lecture',
  ];

  // Les 3 écrans reliés aux boutons du bas
  final List<Widget> _ecrans = const [
    CatalogueScreen(),
    GalerieScreen(),
    MaListeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titres[_currentIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ParametresScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: _ecrans[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Catalogue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Galerie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Ma liste',
          ),
        ],
      ),
    );
  }
}
