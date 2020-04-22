import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/app/common/utils/url_config.dart';

class PokeapiRepository extends Disposable {
  final Dio client;

  PokeapiRepository(this.client);

  Future<Response> fetchPost() async {
    final response = await client.get(UrlConfig.pokedexUrl);
    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
