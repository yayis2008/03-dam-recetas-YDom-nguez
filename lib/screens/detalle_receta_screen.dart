
import 'package:flutter/material.dart';
import '../models/receta.dart';

class DetalleRecetaScreen extends StatelessWidget {
  final Receta receta;

  const DetalleRecetaScreen({
    super.key,
    required this.receta,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la receta'),
        backgroundColor: const Color(0xFF800185),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              receta.imagenUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 240,
                  color: Colors.orange.shade100,
                  child: const Center(
                    child: Icon(
                      Icons.restaurant,
                      size: 70,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receta.nombre,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Cocina: ${receta.cocina}'),
                  Text('Calificación: ${receta.calificacion} ⭐'),
                  Text('Porciones: ${receta.porciones}'),
                  Text('Calorías por porción: ${receta.calorias}'),
                  Text(
                    'Preparación: ${receta.tiempoPreparacion} minutos',
                  ),
                  Text('Cocción: ${receta.tiempoCoccion} minutos'),
                  Text('Tiempo total: ${receta.tiempoTotal} minutos'),
                  const SizedBox(height: 24),
                  const Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...receta.ingredientes.map(
                    (ingrediente) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text('• $ingrediente'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Instrucciones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...receta.instrucciones.asMap().entries.map(
                    (entrada) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        '${entrada.key + 1}. ${entrada.value}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
