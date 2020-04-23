import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTop extends StatefulWidget {
  @override
  _HomeTopState createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        buildPokeballImage(),
        buildMenu(),
      ],
    );
  }

  Widget buildPokeballImage() {
    return Positioned(
      top: -(240 / 4),
      left: _size.width - (240 / 1.4),
      child: Opacity(
        opacity: 0.4,
        child: SvgPicture.asset(
          'assets/images/pokeball.svg',
          color: Colors.grey,
          width: 240,
        ),
      ),
    );
  }

  Widget buildMenu() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 47, 0, 0),
        child: FaIcon(
          FontAwesomeIcons.bars,
          color: Color(0xFF666666),
        ),
      ),
    );
  }
}
