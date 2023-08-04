import 'package:flutter/material.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';
import 'package:pokemon_app/app/presentation/widgets/pokemon_widget.dart';

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({
    super.key,
    required this.pokemons,
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: pokemons.map((e) => PokemonWidget(pokemon: e)).toList(),
    );
  }
}
