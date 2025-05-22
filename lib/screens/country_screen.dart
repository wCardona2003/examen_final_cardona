import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final String id = country['id'] ?? '';
    final String nom = country['nom'] ?? '';
    final String descripcio = country['descripcio'] ?? '';
    final String? foto = country['foto'];
    final String poblacion = country['poblacion'];
    final String capital = country['capital'];


    return Scaffold(
      appBar: AppBar(title: Text(nom)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            foto != null && foto.isNotEmpty
                ? Image.network(foto)
                : const Icon(Icons.image_not_supported, size: 100),
            const SizedBox(height: 16),
            Text('ID: $id'),
            Text('Nombre: $nom'),
            Text('Descripción: $descripcio'),
            Text('Población: $poblacion'),
            Text('Capital: $capital'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
