// beer_state.dart
import 'package:equatable/equatable.dart';
import '../models/beer.dart';

// Clase abstracta que define un estado relacionado con las cervezas.
abstract class BeerState extends Equatable {
  const BeerState();
}

// Clase que representa el estado inicial sin datos de cervezas.
class BeerInitial extends BeerState {
  // Lista vacía de propiedades, ya que este estado no tiene datos.
  @override
  List<Object> get props => [];
}

// Clase que representa el estado cargado con una lista de cervezas.
class BeerLoaded extends BeerState {
  // Lista de cervezas cargadas.
  final List<Beer> beers;

  // Constructor que requiere la lista de cervezas.
  BeerLoaded({required this.beers});

  // Lista de propiedades, en este caso, solo la lista de cervezas.
  @override
  List<Object> get props => [beers];
}

// Clase que representa el estado de error al cargar las cervezas.
class BeerError extends BeerState {
  // Lista vacía de propiedades, ya que este estado no tiene datos adicionales.
  @override
  List<Object> get props => [];
}

