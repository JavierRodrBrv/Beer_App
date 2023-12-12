import 'package:flutter/material.dart';
import '../models/beer.dart';

// Pantalla de detalles de la cerveza que muestra información detallada sobre una cerveza específica.
class BeerDetailScreen extends StatelessWidget {
  // Instancia de la cerveza que se mostrará en esta pantalla.
  final Beer beer;

  // Constructor que requiere una instancia de Beer al crear la pantalla.
  BeerDetailScreen({required this.beer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beer.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contenedor que limita la altura de la imagen y la centra en la pantalla.
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500.0, // Establece la altura máxima de la imagen.
                ),
                child: Center(
                  // Imagen de la cerveza obtenida de la URL proporcionada.
                  child: Image.network(
                    beer.imageUrl,
                    fit: BoxFit.contain, // Ajusta la imagen al contenedor.
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Espacio vertical entre la imagen y la descripción.
              // Texto que muestra la descripción de la cerveza.
              Text(beer.description),
            ],
          ),
        ),
      ),
    );
  }
}


