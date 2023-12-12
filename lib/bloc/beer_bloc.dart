import 'package:bloc/bloc.dart';
import '../services/beer_service.dart';
import '../models/beer.dart';
import 'beer_event.dart';
import 'beer_state.dart';


// La clase BeerBloc extiende la clase Bloc y gestiona el estado relacionado con las cervezas.
class BeerBloc extends Bloc<BeerEvent, BeerState> {
  // Instancia de BeerService para realizar operaciones relacionadas con la obtención de cervezas.
  final BeerService beerService = BeerService();

  // Constructor de BeerBloc, que inicializa el estado como BeerInitial.
  BeerBloc() : super(BeerInitial());

  // Getter que devuelve el estado inicial de BeerInitial.
  @override
  BeerState get initialState => BeerInitial();

  // Método que asigna eventos a estados mediante el manejo de FetchBeers.
  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    if (event is FetchBeers) {
      try {
        // Intenta obtener la lista de cervezas utilizando BeerService.
        final List<Beer> beers = await beerService.getBeers();

        // Emite el estado BeerLoaded con la lista de cervezas si la operación es exitosa.
        yield BeerLoaded(beers: beers);
      } catch (error) {
        // En caso de error, emite el estado BeerError.
        yield BeerError();
      }
    }
  }
}

