import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../widgets/livre_grid_item.dart';

class GalerieScreen extends StatelessWidget {
  const GalerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: livres.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,          // 2 colonnes
          crossAxisSpacing: 10,       // espacement horizontal
          mainAxisSpacing: 10,        // espacement vertical
          childAspectRatio: 0.75,     // proportion hauteur / largeur
        ),
        itemBuilder: (context, index) {
          return LivreGridItem(livre: livres[index]);
        },
      ),
    );
  }
}