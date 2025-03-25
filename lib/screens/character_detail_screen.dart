import 'package:flutter/material.dart';
import 'package:app_graphql/models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? 'Unknown'),  // Asigna 'Unknown' si es null
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${character.name ?? 'Unknown'}',  // Asigna 'Unknown' si es null
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Species: ${character.species ?? 'Unknown'}',  // Asigna 'Unknown' si es null
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Status: ${character.status ?? 'Unknown'}',  // Asigna 'Unknown' si es null
              style: TextStyle(fontSize: 18),
            ),
            // Puedes agregar más información aquí como origen, ubicación, etc.
          ],
        ),
      ),
    );
  }
}
