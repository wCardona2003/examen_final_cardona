import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  static Future<List<Country>> fetchCountries() async {
    final url = Uri.parse('https://caa7a0cc3320c0a09777.free.beeceptor.com/api/paises/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data.values.map((e) => Country.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar platos');
    }
  }
}
