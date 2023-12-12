// beer_event.dart
import 'package:equatable/equatable.dart';

// Clase abstracta que define un evento relacionado con las cervezas.
abstract class BeerEvent extends Equatable {
  const BeerEvent();
}

// Clase concreta que representa el evento de obtención de cervezas.
class FetchBeers extends BeerEvent {
  // Lista vacía de propiedades, ya que este evento no tiene parámetros.
  @override
  List<Object> get props => [];
}
