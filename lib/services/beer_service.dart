import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/beer.dart';

// Servicio que se encarga de realizar la solicitud HTTP para obtener datos de cervezas de una API.
class BeerService {
  // Método asincrónico que devuelve una lista de objetos Beer.
  Future<List<Beer>> getBeers() async {
    try {
      // Realiza una solicitud HTTP GET a la API de cervezas con parámetros de filtro.
      final response = await http.get(
        Uri.parse('https://api.punkapi.com/v2/beers?brewed_before=11-2012&abv_gt=6'),
      );

      // Verifica si la solicitud fue exitosa (código de estado 200).
      if (response.statusCode == 200) {
        // Decodifica los datos JSON de la respuesta y los mapea a objetos Beer.
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Beer(
          name: json['name'],
          imageUrl: json['image_url'],
          description: json['description'],
        )).toList();
      } else {
        // Lanza una excepción si la solicitud no fue exitosa.
        throw Exception('Failed to load beers - ${response.statusCode}');
      }
    } catch (error) {
      // Captura y maneja cualquier error durante el proceso y lanza una excepción.
      print('Error in getBeers: $error'); // Imprime detalles del error en la consola.
      throw Exception('Failed to load beers: $error');
    }
  }
}

