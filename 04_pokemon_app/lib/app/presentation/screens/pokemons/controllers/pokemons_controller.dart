import 'package:flutter_meedu/meedu.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';

import 'package:pokemon_app/app/infrastructure/datasources/poke_api_datasource.dart';

import 'package:pokemon_app/app/infrastructure/repositories/pokemon_repository_impl.dart';

class PokemonsController extends SimpleNotifier {
  int page = 1;
  List<Pokemon> pokemons = [];
  bool isLoading = false;
  bool showList = true;

  void setPage() {
    page += 1;
    loadPokemons();
    notify();
  }

  void loadPokemons() async {
    isLoading = true;
    notify();
    final repository = PokemonRepositoryImpl(PokeApiDataSource());
    pokemons = await repository.getPokemons(page);
    isLoading = false;
    notify();
  }

  void changeModeView() {
    showList = !showList;
    notify();
  }
}
