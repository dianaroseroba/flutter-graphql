// lib/screens/film_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:app_graphql/models/film.dart';
import 'package:app_graphql/models/species.dart';

class FilmDetailScreen extends StatelessWidget {
  final Film film;

  const FilmDetailScreen({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(film.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  film.title.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Título', film.title),
                    Divider(),
                    _buildDetailRow('Director', film.director),
                    Divider(),
                    _buildDetailRow('Fecha de estreno', film.releaseDate),
                    Divider(),
                    _buildSpeciesList(film.species),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeciesList(List<Species> speciesList) {
    if (speciesList.isEmpty) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Especies', style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 8),
          for (var species in speciesList) 
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(species.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text('Clasificación: ${species.classification}', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text('Homeworld: ${species.homeworld}', style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
