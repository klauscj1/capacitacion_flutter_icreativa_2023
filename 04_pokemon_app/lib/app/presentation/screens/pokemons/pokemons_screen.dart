import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:pokemon_app/app/presentation/screens/pokemons/controllers/pokemons_controller.dart';
import 'package:pokemon_app/app/presentation/views/pokemons_list_view.dart';

final pokemonsProvider = SimpleProvider((ref) => PokemonsController());

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemons"),
        actions: [
          Consumer(
            builder: (_, ref, __) {
              final isLoading = ref
                  .watch(pokemonsProvider.select((p0) => p0.isLoading))
                  .isLoading;
              return isLoading
                  ? const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: CircularProgressIndicator(),
                    )
                  : IconButton(
                      onPressed: () {
                        pokemonsProvider.read.loadPokemons();
                      },
                      icon: const Icon(Icons.refresh),
                    );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              bool showList = ref
                  .watch(pokemonsProvider.select((p0) => p0.showList))
                  .showList;
              IconData iconData = showList ? Icons.grid_4x4 : Icons.list;
              return IconButton(
                onPressed: () {
                  pokemonsProvider.read.changeModeView();
                },
                icon: Icon(iconData),
              );
            },
          )
        ],
      ),
      body: Center(child: Consumer(
        builder: (_, ref, __) {
          final controller = ref.watch(pokemonsProvider);

          return controller.showList
              ? PokemonsListView(pokemons: controller.pokemons)
              : GridView.count(
                  crossAxisCount: 2,
                  children: controller.pokemons
                      .map((e) => Column(
                            children: [
                              Image.network(
                                e.imagenFrontUrl,
                              ),
                              Text(e.nombre),
                              Text(e.id.toString()),
                            ],
                          ))
                      .toList(),
                );
        },
      )),
    );
  }
}
