import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_graphql/controllers/character_controller.dart';
import 'package:app_graphql/widgets/character_card.dart';
import 'package:app_graphql/screens/character_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final CharacterController characterController = Get.find<CharacterController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick and Morty Characters')),
      body: RefreshIndicator(
        onRefresh: () => characterController.fetchCharacters(),
        child: Obx(() {
          if (characterController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (characterController.error.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${characterController.error.value}',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => characterController.fetchCharacters(),
                    child: Text('Reintentar'),
                  ),
                ],
              ),
            );
          } else if (characterController.characters.isEmpty) {
            return Center(child: Text('No hay personajes disponibles'));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: characterController.characters.length,
              itemBuilder: (context, index) {
                final character = characterController.characters[index];
                return CharacterCard(
                  character: character,
                  onTap: () {
                    // Navegar a la pantalla de detalles del personaje
                    Get.to(() => CharacterDetailScreen(character: character));
                  },
                );
              },
            );
          }
        }),
      ),
    );
  }
}
