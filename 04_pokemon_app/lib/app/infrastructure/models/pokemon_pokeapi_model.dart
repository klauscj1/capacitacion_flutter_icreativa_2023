class PokemonPokeApiResult {
  String name;
  String url;

  PokemonPokeApiResult({
    required this.name,
    required this.url,
  });

  factory PokemonPokeApiResult.fromJson(Map<String, dynamic> json) =>
      PokemonPokeApiResult(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
