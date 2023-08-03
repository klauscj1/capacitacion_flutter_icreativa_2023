import 'package:pokemon_app/app/domain/models/pokemon_model.dart';
import 'package:pokemon_app/app/infrastructure/models/pokemon_pokeapi_model.dart';

class PokeApiToPokemonMapper {
  Pokemon pokemonPokeApiToPokemon(PokemonPokeApiResult result) {
    List<String> splirUrl = result.url.split("/");
    String idString = splirUrl[splirUrl.length - 2];

    return Pokemon(
      id: int.parse(idString),
      nombre: result.name,
      imagenFrontUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$idString.png",
      imagenBackUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$idString.png",
    );
  }
}
