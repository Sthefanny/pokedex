import 'package:mobx/mobx.dart';
import 'package:pokedex/app/common/models/pokedex_model.dart';
import 'package:pokedex/app/common/services/pokeapi_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeapiService service;

  _HomeControllerBase(this.service);

  Future<Pokedex> getAllPokemons() async {
    Pokedex pokedex;
    try {
      pokedex = await service.getAllPokemons();
    } catch (e) {
      throw FormatException('Um erro aconteceu');
    }
    return pokedex;
  }
}
