import 'package:flutter/material.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  // Calcule l'état global : true (tous lus), false (aucun lu), null (partiellement lu -> tristate)
  bool? get _etatGlobal {
    final tousLus = livres.every((livre) => livre.lu);
    final aucunLu = livres.every((livre) => !livre.lu);

    if (tousLus) return true;
    if (aucunLu) return false;
    return null; // état intermédiaire
  }

  // Coche ou décoche l'ensemble des livres
  void _toggleTous(bool? valeur) {
    setState(() {
      final cible = valeur ?? false;
      for (var livre in livres) {
        livre.lu = cible;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final nbLus = livres.where((l) => l.lu).length;

    return Column(
      children: [
        // Case globale « Tous » avec tristate
        CheckboxListTile(
          title: const Text(
            'Tous les livres',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('$nbLus sur ${livres.length} lus'),
          tristate: true,
          value: _etatGlobal,
          onChanged: _toggleTous,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const Divider(height: 1, thickness: 1.5),

        // Liste des livres avec case à cocher individuelle
        Expanded(
          child: ListView.separated(
            itemCount: livres.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final livre = livres[index];
              return CheckboxListTile(
                value: livre.lu,
                title: Text(
                  livre.titre,
                  style: TextStyle(
                    decoration: livre.lu ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(livre.auteur),
                secondary: CircleAvatar(
                  backgroundColor: livre.couleur,
                  child: Text(
                    livre.titre.isNotEmpty ? livre.titre[0] : '?',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (bool? valeur) {
                  setState(() {
                    livre.lu = valeur ?? false;
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