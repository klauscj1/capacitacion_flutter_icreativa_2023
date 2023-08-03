import 'package:pokemon_app/app/domain/datasources/pokemons_datasource.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/app/infrastructure/mappers/pokeapi_to_pokemon_mapper.dart';
import 'package:pokemon_app/app/infrastructure/models/responses/pokemons_pokeapi_response.dart';

class PokeApiDataSource extends PokemonDatasource {
  @override
  Future<List<Pokemon>> getPokemons(int page) async {
    int rowPerPage = 20;
    int offset = (page - 1) * rowPerPage;
    int limit = page * rowPerPage;
    var url = Uri.parse(
        "https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=$limit");
    var response = await http.get(url);
    PokemonsPokeApiResponse pokeApiResult =
        pokemonPokeApiResponseFromJson(response.body);
    List<Pokemon> pokemons = pokeApiResult.results
        .map((x) => PokeApiToPokemonMapper().pokemonPokeApiToPokemon(x))
        .toList();
    return pokemons;
  }
}
