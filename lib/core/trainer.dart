import 'pokemon.dart';

class Trainer {
  String name;
  List<Pokemon> pokemons;
  Trainer({required this.name, required this.pokemons});

  void addPokemon(Pokemon pokemon) {
    pokemons.add(pokemon);
  }
}
