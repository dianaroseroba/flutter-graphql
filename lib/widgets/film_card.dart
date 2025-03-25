// lib/widgets/film_card.dart
import 'package:flutter/material.dart';
import 'package:app_graphql/models/film.dart';

class FilmCard extends StatelessWidget {
  final Film film;
  final VoidCallback onTap;

  const FilmCard({Key? key, required this.film, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(film.title),
        subtitle: Text('Director: ${film.director}\nRelease Date: ${film.releaseDate}'),
        onTap: onTap,
      ),
    );
  }
}
