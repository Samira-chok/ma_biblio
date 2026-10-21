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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 36),
                decoration: BoxDecoration(
                  color: livre.couleur,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    livre.titre.isNotEmpty ? livre.titre[0] : '?',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                    title: const Text('Année de publication'),
                    subtitle: Text(livre.annee.toString()),
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
      ),
    );
  }
}