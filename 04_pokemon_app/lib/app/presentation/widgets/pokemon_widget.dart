import 'package:flutter/material.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';
import 'package:pokemon_app/app/presentation/screens/pokemon/pokemon_screen.dart';
import 'package:pokemon_app/app/presentation/screens/pokemons/pokemons_screen.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    bool isShowList = pokemonsProvider.read.showList;
    return InkWell(
      child: isShowList
          ? ListTile(
              title: Text(pokemon.nombre),
              subtitle: Text("Id: ${pokemon.id}"),
              leading: Hero(
                tag: "poke-${pokemon.id}-tag",
                child: Image.network(
                  pokemon.imagenFrontUrl,
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ),
            )
          : Column(
              children: [
                Hero(
                  tag: "poke-${pokemon.id}-tag",
                  child: Image.network(
                    pokemon.imagenFrontUrl,
                  ),
                ),
                Text(pokemon.nombre),
                Text(pokemon.id.toString()),
              ],
            ),
      onTap: () {
        pokemonProvider.read.setPokemon(pokemon);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const PokemonScreen()));
      },
    );
  }
}
