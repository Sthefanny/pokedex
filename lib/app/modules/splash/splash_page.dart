import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final tween = MultiTrackTween([
    Track('rotation').add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.0),
        curve: Curves.linear)
  ]);

  @override
  void initState() {
    super.initState();
    startApp();
  }

  startApp() {
    Future.delayed(
        Duration(seconds: 3), () => Modular.to.pushReplacementNamed('home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ControlledAnimation(
          playback: Playback.LOOP,
          duration: tween.duration,
          tween: tween,
          builder: (context, animation) {
            return Transform.rotate(
              angle: animation['rotation'],
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/pokeball_colored.svg',
                  width: 300,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
