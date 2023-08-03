import 'package:pokemon_app/app/domain/models/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<List<Pokemon>> getPokemons(int page);
}
