import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../widgets/livre_card.dart';

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

  @override
  Widget build(BuildContext context) {
    final livresFiltres = genreSelectionne == 'Tous'
        ? livres
        : livres.where((l) => l.genre == genreSelectionne).toList();

    return Column(
      children: [
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
        Expanded(
          child: ListView.builder(
            itemCount: livresFiltres.length,
            itemBuilder: (context, index) {
              return LivreCard(
                livre: livresFiltres[index],
                onFavoriChanged: () => setState(() {}),
              );
            },
          ),
        ),
      ],
    );
  }
}
