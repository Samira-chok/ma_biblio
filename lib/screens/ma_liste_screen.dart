import 'package:flutter/material.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  // Calcul de l'état tristate : true, false, ou null
  bool? get _etatGlobal {
    final tousLus = livres.every((l) => l.lu);
    final aucunLu = livres.every((l) => !l.lu);
    if (tousLus) return true;
    if (aucunLu) return false;
    return null; // État intermédiaire (tristate)
  }

  void _cocherTout(bool? valeur) {
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
        // Case globale « Tous »
        CheckboxListTile(
          title: const Text('Tous les livres', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('$nbLus sur ${livres.length} lus'),
          tristate: true,
          value: _etatGlobal,
          onChanged: _cocherTout,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const Divider(height: 1),

        // Liste avec CheckboxListTile individuel
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