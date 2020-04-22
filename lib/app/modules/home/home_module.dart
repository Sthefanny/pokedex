import 'package:dio/dio.dart';
import 'package:pokedex/app/common/repositories/pokeapi_repository.dart';
import 'package:pokedex/app/common/services/pokeapi_service.dart';
import 'package:pokedex/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokeapiRepository(Dio())),
        Bind((i) => PokeapiService(i.get<PokeapiRepository>())),
        Bind((i) => HomeController(i.get<PokeapiService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
