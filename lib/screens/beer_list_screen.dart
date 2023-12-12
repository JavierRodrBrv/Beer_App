import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/beer_bloc.dart';
import '../bloc/beer_event.dart';
import '../bloc/beer_state.dart';
import 'beer_detail_screen.dart';

// Pantalla principal que muestra una lista de cervezas y permite la búsqueda.
class BeerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeerBloc()..add(FetchBeers()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Beer List'),
        ),
        body: BeerList(),
      ),
    );
  }
}

// Widget de la lista de cervezas que incluye la barra de búsqueda y la lista filtrada.
class BeerList extends StatefulWidget {
  @override
  _BeerListState createState() => _BeerListState();
}

class _BeerListState extends State<BeerList> {
  // Variable para almacenar el término de búsqueda.
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda que actualiza el término de búsqueda al cambiar.
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: TextField(
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        // Lista de cervezas filtrada según el término de búsqueda.
        Expanded(
          child: BlocBuilder<BeerBloc, BeerState>(
            builder: (context, state) {
              if (state is BeerLoaded) {
                final filteredBeers = state.beers
                    .where((beer) =>
                    beer.name.toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList();

                return ListView.builder(
                  itemCount: filteredBeers.length,
                  itemBuilder: (context, index) {
                    final beer = filteredBeers[index];
                    return ListTile(
                      leading: Image.network(beer.imageUrl),
                      title: Text(beer.name),
                      subtitle: Text(beer.description),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeerDetailScreen(beer: beer),
                          ),
                        );
                      },
                    );
                  },
                );
              } else if (state is BeerError) {
                return Center(
                  child: Text('Failed to load beers'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

// Barra de búsqueda reutilizable.
class BeerSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  BeerSearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 16.0,  // Resta el padding de ambos lados
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}


