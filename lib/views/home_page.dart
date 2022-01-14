import 'package:flutter/material.dart';
import 'package:zombieland/views/components/packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RiveAnimationController _controller;
  AudioCache audioCache = AudioCache(prefix: 'assets/audios/');
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Hit',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: deviceHeight * 0.20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                TopBar(),
                Positioned(
                  bottom: 45,
                  child: Text(
                    'Zombieland',
                    style: GoogleFonts.gloriaHallelujah(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: deviceHeight * 0.45,
            child: RiveAnimation.asset(
              'assets/animations/zombie_character.riv',
              animations: const ['Walk', 'Hit'],
              controllers: [_controller],
            ),
          ),
          SizedBox(height: deviceHeight * 0.20),
          Row(
            children: [
              SizedBox(width: deviceWidth * 0.80),
              FloatingActionButton(
                // disable the button while playing the animation
                onPressed: () async {
                  _isPlaying ? null : _controller.isActive = true;
                  await audioCache.play(
                    'gun_shot.wav',
                    mode: PlayerMode.LOW_LATENCY,
                  );
                },
                tooltip: 'Play',
                backgroundColor: colorOne,
                splashColor: buttonBackgroundColor,
                elevation: 10.0,
                child: Image.asset(
                  'assets/images/gun.png',
                  width: 45,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
