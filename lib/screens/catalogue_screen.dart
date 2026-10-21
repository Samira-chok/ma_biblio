import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../models/livre.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  final List<String> genres = [
    'Tous',
    'Roman',
    'Science',
    'Histoire',
    'Jeunesse',
    'Informatique',
  ];
  String genreSelectionne = 'Tous';

  Widget _buildLivreTile(Livre livre) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: livre.couleur,
        child: Text(
          livre.titre.isNotEmpty ? livre.titre[0] : '?',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(livre.titre),
      subtitle: Text('${livre.auteur} – ${livre.annee}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(livre.note.toString()),
          const Icon(Icons.star, color: Colors.amber, size: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filtrage des livres selon le genre sélectionné
    final livresFiltres = genreSelectionne == 'Tous'
        ? livres
        : livres.where((l) => l.genre == genreSelectionne).toList();

    return Column(
      children: [
        // 1. Liste horizontale des filtres de genre
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, index) {
              final genre = genres[index];
              final isSelected = genre == genreSelectionne;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 8.0,
                ),
                child: ChoiceChip(
                  label: Text(genre),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      genreSelectionne = genre;
                    });
                  },
                ),
              );
            },
          ),
        ),

        // 2. Liste verticale des livres avec séparateurs
        Expanded(
          child: ListView.separated(
            itemCount: livresFiltres.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return _buildLivreTile(livresFiltres[index]);
            },
          ),
        ),
      ],
    );
  }
}
