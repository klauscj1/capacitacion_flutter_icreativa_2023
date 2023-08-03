import 'dart:convert';

import 'package:pokemon_app/app/infrastructure/models/pokemon_pokeapi_model.dart';

PokemonsPokeApiResponse pokemonPokeApiResponseFromJson(String str) =>
    PokemonsPokeApiResponse.fromJson(json.decode(str));

String pokemonPokeApiResponseToJson(PokemonsPokeApiResponse data) =>
    json.encode(data.toJson());

class PokemonsPokeApiResponse {
  List<PokemonPokeApiResult> results;

  PokemonsPokeApiResponse({
    required this.results,
  });

  factory PokemonsPokeApiResponse.fromJson(Map<String, dynamic> json) =>
      PokemonsPokeApiResponse(
        results: List<PokemonPokeApiResult>.from(
            json["results"].map((x) => PokemonPokeApiResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
