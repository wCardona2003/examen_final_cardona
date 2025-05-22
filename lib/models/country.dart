class Country {
  final String id;
  final String nom;
  final String descripcio;
  final String? foto;
  final String poblacion;
  final String capital;

  Country({
    required this.id,
    required this.nom,
    required this.descripcio,
    required this.foto,
    required this.poblacion,
    required this.capital,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['nom'],
      nom: json['nom'],
      descripcio: json['descripcio'],
      foto: json['tipus'],
      poblacion: json['disponible'],
      capital: json['restaurant'],
    );
  }
}
