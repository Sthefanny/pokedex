import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/common/models/pokedex_model.dart';
import 'home_controller.dart';
import 'widgets/home_top.dart';
import 'widgets/pokemon_item.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeTop(),
            buildTitle(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'Pokedex',
      style: GoogleFonts.mavenPro(
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildBody() {
    return FutureBuilder<Object>(
      future: controller.getAllPokemons(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        Pokedex data = snapshot.data;

        return Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: data.pokemon.length,
              itemBuilder: (_, index) {
                Pokemon pokemon = data.pokemon[index];
                return PokemonItem(pokemon: pokemon);
              },
            ),
          ),
        );
      },
    );
  }
}
