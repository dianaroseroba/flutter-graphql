import 'package:flutter/material.dart';
import 'package:app_graphql/models/character.dart'; // Asegúrate de tener el modelo de Character

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  const CharacterCard({super.key, required this.character, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.name ?? 'Nombre desconocido', // Usamos un valor predeterminado para evitar null
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.accessibility_new, size: 16, color: Colors.grey), // Puedes usar otro ícono
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      character.species ?? 'Desconocido', // Usamos un valor predeterminado para evitar null
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.info, size: 16, color: Colors.grey), // Ícono para el estado
                  SizedBox(width: 8),
                  Text(
                    character.status ?? 'Desconocido', // Usamos un valor predeterminado para evitar null
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
