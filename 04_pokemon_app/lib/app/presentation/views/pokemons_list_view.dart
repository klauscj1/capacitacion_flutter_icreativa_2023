import 'package:flutter/material.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';

class PokemonsListView extends StatelessWidget {
  const PokemonsListView({
    super.key,
    required this.pokemons,
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (BuildContext context, int index) {
        final pokemon = pokemons[index];
        return ListTile(
          title: Text(pokemon.nombre),
          leading: Image.network(
            pokemon.imagenFrontUrl,
            height: 180,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
