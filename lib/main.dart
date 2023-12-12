import 'package:flutter/material.dart';
import 'screens/beer_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configuración del tema y el título de la aplicación.
    return MaterialApp(
      title: 'Flutter Beer App',
      theme: ThemeData(
        primarySwatch: Colors.amber, // Color principal para la barra de aplicaciones, etc.
      ),
      home: BeerListScreen(), // Pantalla de inicio de la aplicación.
    );
  }
}

