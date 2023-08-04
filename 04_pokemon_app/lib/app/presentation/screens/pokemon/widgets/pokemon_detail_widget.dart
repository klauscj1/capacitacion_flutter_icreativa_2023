import 'package:flutter/material.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';

class PokemonDetailsWidget extends StatelessWidget {
  const PokemonDetailsWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("El ID del pokemon es: ${pokemon.id}"),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("El pokemon es: ${pokemon.nombre}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                pokemon.imagenFrontUrl,
                width: 150,
              ),
              Image.network(
                pokemon.imagenBackUrl,
                width: 150,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Text(pokemon.nombre);
            },
          ),
        )
      ],
    );
  }
}
