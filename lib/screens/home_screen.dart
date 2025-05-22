import 'dart:convert';

import 'package:examen_final_cardona/models/country.dart';
import 'package:examen_final_cardona/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import 'country_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ApiService countryApi = ApiService();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla Principal')),
      body: Container(
        //itemCount: ApiService().fetchCountries().length,
        //itemBuilder: (context, index) {
        //  final country = ApiService().fetchCountries()[index];
        //  return ListTile(
        //    leading: country['foto'] != null
        //        ? Image.network(country['foto'], width: 50, height: 50, fit: BoxFit.cover)
        //        : const Icon(Icons.fastfood, size: 50),
        //    title: Text(country['nom']),
        //    onTap: () {
        //      Navigator.push(
        //        context,
        //        MaterialPageRoute(builder: (_) => CountryScreen(country: country)),
        //      );
        //    },
        //  );
      ),
    );
  }
}
