import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../screens/detail_screen.dart';

class LivreCard extends StatefulWidget {
  final Livre livre;
  final VoidCallback? onFavoriChanged;

  const LivreCard({
    super.key,
    required this.livre,
    this.onFavoriChanged,
  });

  @override
  State<LivreCard> createState() => _LivreCardState();
}

class _LivreCardState extends State<LivreCard> {
  @override
  Widget build(BuildContext context) {
    final livre = widget.livre;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(livre: livre),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Couverture du livre stylisée
              Container(
                width: 55,
                height: 75,
                decoration: BoxDecoration(
                  color: livre.couleur,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    livre.titre.isNotEmpty ? livre.titre[0] : '?',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Informations du livre
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            livre.titre,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (livre.nouveaute)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'NOUVEAU',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${livre.auteur} • ${livre.annee}',
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            livre.genre,
                            style: TextStyle(
                              color: Colors.indigo.shade700,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          livre.note.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Bouton favori
              IconButton(
                icon: Icon(
                  livre.favori ? Icons.favorite : Icons.favorite_border,
                  color: livre.favori ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    livre.favori = !livre.favori;
                  });
                  if (widget.onFavoriChanged != null) {
                    widget.onFavoriChanged!();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}