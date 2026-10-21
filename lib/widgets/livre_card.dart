import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../screens/detail_screen.dart';

class LivreCard extends StatelessWidget {
  final Livre livre;
  final VoidCallback onFavoriTap;

  const LivreCard({
    super.key,
    required this.livre,
    required this.onFavoriTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(livre: livre),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: livre.couleur,
          child: Text(
            livre.titre.isNotEmpty ? livre.titre[0] : '?',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          livre.titre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${livre.auteur} - ${livre.annee}\nGenre : ${livre.genre}'),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${livre.note}'),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            IconButton(
              icon: Icon(
                livre.favori ? Icons.favorite : Icons.favorite_border,
                color: livre.favori ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoriTap,
            ),
          ],
        ),
      ),
    );
  }
}