import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../widgets/livre_card.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  final List<String> genres = ['Tous', 'Roman', 'Science', 'Histoire', 'Jeunesse', 'Informatique'];
  String genreSelectionne = 'Tous';

  @override
  Widget build(BuildContext context) {
    // Filtrage simple
    final livresFiltres = genreSelectionne == 'Tous'
        ? livres
        : livres.where((l) => l.genre == genreSelectionne).toList();

    return Column(
      children: [
        // ListView horizontal de filtrage (Q2 demandée)
        SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, index) {
              final genre = genres[index];
              final isSelected = genre == genreSelectionne;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                child: isSelected
                    ? ElevatedButton(
                        onPressed: () {},
                        child: Text(genre),
                      )
                    : OutlinedButton(
                        onPressed: () {
                          setState(() {
                            genreSelectionne = genre;
                          });
                        },
                        child: Text(genre),
                      ),
              );
            },
          ),
        ),

        // ListView des cartes de livres
        Expanded(
          child: ListView.builder(
            itemCount: livresFiltres.length,
            itemBuilder: (context, index) {
              return LivreCard(
                livre: livresFiltres[index],
                onFavoriTap: () {
                  setState(() {
                    livresFiltres[index].favori = !livresFiltres[index].favori;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}