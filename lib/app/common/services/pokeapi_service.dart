import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/common/models/pokedex_model.dart';
import 'package:pokedex/app/common/repositories/pokeapi_repository.dart';

class PokeapiService extends Disposable {
  final PokeapiRepository repository;

  PokeapiService(this.repository);

  Future<Pokedex> getAllPokemons() async {
    Pokedex pokedex;

    Response response = await repository.fetchPost();
    if (response.statusCode >= 200 && response.statusCode <= 300)
      pokedex = Pokedex.fromJson(jsonDecode(response.data));

    return pokedex;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
