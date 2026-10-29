
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const RecetasApp());
}

class RecetasApp extends StatelessWidget {
  const RecetasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recetas del Mayab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF800185),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
