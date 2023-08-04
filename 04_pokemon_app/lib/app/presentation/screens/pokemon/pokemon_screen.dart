import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:pokemon_app/app/presentation/screens/pokemon/controllers/pokemon_controller.dart';
import 'package:pokemon_app/app/presentation/screens/pokemon/widgets/custom_pokemon_sliver_appbar.dart';
import 'package:pokemon_app/app/presentation/screens/pokemon/widgets/pokemon_detail_widget.dart';

final pokemonProvider =
    SimpleProvider<PokemonController>((ref) => PokemonController());

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = pokemonProvider.read.pokemon;
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomPokemonSliverAppBar(pokemon: pokemon),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PokemonDetailsWidget(pokemon: pokemon);
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
