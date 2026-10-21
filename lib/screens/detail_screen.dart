import 'package:flutter/material.dart';
import '../models/livre.dart';

class DetailScreen extends StatelessWidget {
  final Livre livre;

  const DetailScreen({super.key, required this.livre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(livre.titre),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: livre.couleur,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                livre.titre.isNotEmpty ? livre.titre[0] : '?',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Titre'),
                  subtitle: Text(livre.titre),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Auteur'),
                  subtitle: Text(livre.auteur),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Genre'),
                  subtitle: Text(livre.genre),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Année'),
                  subtitle: Text('${livre.annee}'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: const Text('Note'),
                  subtitle: Text('${livre.note} / 5'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}