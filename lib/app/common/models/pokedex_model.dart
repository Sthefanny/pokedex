import 'package:json_annotation/json_annotation.dart';

part 'pokedex_model.g.dart';

@JsonSerializable()
class Pokedex {
  List<Pokemon> pokemon;

  Pokedex({this.pokemon});

  factory Pokedex.fromJson(Map<String, dynamic> json) =>
      _$PokedexFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexToJson(this);
}

@JsonSerializable()
class Pokemon {
  int id;
  @JsonKey(name: 'num')
  String number;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;

  List<String> weaknesses;
  List<Evolution> nextEvolution;
  List<Evolution> prevEvolution;

  Pokemon(
      {this.id,
      this.number,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Evolution {
  @JsonKey(name: 'num')
  String number;
  String name;

  Evolution({this.number, this.name});

  factory Evolution.fromJson(Map<String, dynamic> json) =>
      _$EvolutionFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionToJson(this);
}
