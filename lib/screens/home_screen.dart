// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_graphql/controllers/film_controller.dart';
import 'package:app_graphql/screens/film_detail_screen.dart';
import 'package:app_graphql/widgets/film_card.dart';

class HomeScreen extends StatelessWidget {
  final FilmController filmController = Get.find<FilmController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Star Wars Films'), elevation: 2),
      body: RefreshIndicator(
        onRefresh: () => filmController.fetchFilms(),
        child: Obx(() {
          if (filmController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (filmController.error.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${filmController.error.value}',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => filmController.fetchFilms(),
                    child: Text('Reintentar'),
                  ),
                ],
              ),
            );
          } else if (filmController.films.isEmpty) {
            return Center(child: Text('No hay películas disponibles'));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: filmController.films.length,
              itemBuilder: (context, index) {
                final film = filmController.films[index];
                return FilmCard(
                  film: film,
                  onTap: () {
                    Get.to(() => FilmDetailScreen(film: film));
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
