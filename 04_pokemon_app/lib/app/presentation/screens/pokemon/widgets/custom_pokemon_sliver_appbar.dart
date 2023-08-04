import 'package:flutter/material.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';

class CustomPokemonSliverAppBar extends StatelessWidget {
  const CustomPokemonSliverAppBar({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.grey.shade700,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(pokemon.nombre),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Hero(
                tag: "poke-${pokemon.id}-tag",
                child: Image.network(
                  pokemon.imagenFrontUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87],
                    stops: [0.7, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
