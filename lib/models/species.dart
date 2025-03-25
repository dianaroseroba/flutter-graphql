class Species {
  final String name;
  final String classification;
  final String homeworld;

  Species({
    required this.name,
    required this.classification,
    required this.homeworld,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'],
      classification: json['classification'],
      homeworld: json['homeworld']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'classification': classification,
      'homeworld': {'name': homeworld},
    };
  }
}
