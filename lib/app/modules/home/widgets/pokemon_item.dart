import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/common/models/pokedex_model.dart';
import 'package:pokedex/app/common/utils/colors_type.dart';

class PokemonItem extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonItem({Key key, this.pokemon}) : super(key: key);
  @override
  _PokemonItemState createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  @override
  Widget build(BuildContext context) {
    return buildPokemonCard();
  }

  Widget buildPokemonCard() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsType.getColorbyType(widget.pokemon.type[0]),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/images/pokeball.svg',
                color: Colors.white.withOpacity(0.3),
                width: 90,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: getImage(number: widget.pokemon.number),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              widget.pokemon.name,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getImage({@required String number}) {
    return CachedNetworkImage(
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png',
      width: 90,
    );
  }
}
