class Character {
  final String? name;
  final String? species;
  final String? status;

  // Constructor con parámetros opcionales
  Character({
    this.name,
    this.species,
    this.status,
  });

  // Método fromJson con manejo de valores nulos
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      // Si el valor es null, se asigna 'Desconocido'
      name: json['name'] ?? 'Desconocido', 
      species: json['species'] ?? 'Desconocido',
      status: json['status'] ?? 'Desconocido',
    );
  }
}
