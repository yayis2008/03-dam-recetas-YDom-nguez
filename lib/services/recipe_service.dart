
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/receta.dart';

class RecipeService {
  final String url = 'https://dummyjson.com/recipes';

  Future<List<Receta>> obtenerRecetas() async {
    final respuesta = await http.get(Uri.parse(url));

    if (respuesta.statusCode == 200) {
      final datos = jsonDecode(respuesta.body);
      final List lista = datos['recipes'];

      return lista
          .map((receta) => Receta.fromJson(receta))
          .toList();
    } else {
      throw Exception(
        'Error al cargar recetas: ${respuesta.statusCode}',
      );
    }
  }
}
