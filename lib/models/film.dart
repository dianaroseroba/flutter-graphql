// lib/models/film.dart
import 'species.dart'; // Importamos la clase Species para usarla

class Film {
  final String title;
  final String director;
  final String releaseDate;
  final List<Species> species; // Lista de especies asociadas a la película

  Film({
    required this.title,
    required this.director,
    required this.releaseDate,
    required this.species,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    var speciesFromJson = json['speciesConnection']['species'] as List;
    List<Species> speciesList =
        speciesFromJson.map((speciesJson) => Species.fromJson(speciesJson)).toList();

    return Film(
      title: json['title'],
      director: json['director'],
      releaseDate: json['releaseDate'],
      species: speciesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'director': director,
      'releaseDate': releaseDate,
      'speciesConnection': {
        'species': species.map((e) => e.toJson()).toList(),
      },
    };
  }
}
