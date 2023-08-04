import 'package:flutter_meedu/meedu.dart';
import 'package:pokemon_app/app/domain/models/pokemon_model.dart';

class PokemonController extends SimpleNotifier {
  late Pokemon pokemon;

  void setPokemon(Pokemon pokemon) {
    this.pokemon = pokemon;
    notify();
  }
}
