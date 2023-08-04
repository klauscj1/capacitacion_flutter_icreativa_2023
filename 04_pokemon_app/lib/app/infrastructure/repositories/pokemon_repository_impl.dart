import 'package:pokemon_app/app/domain/datasources/pokemons_datasource.dart';
import 'package:pokemon_app/app/domain/models/pokemon_detail_model.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';
import 'package:pokemon_app/app/domain/repositories/pokemons_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<List<Pokemon>> getPokemons(int page) => datasource.getPokemons(page);

  @override
  Future<PokemonDetail?> getPokemon(int id) => datasource.getPokemon(id);
}
