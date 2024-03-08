import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'score_widget.dart';
import 'slider_control.dart';
import 'game_controls.dart';
import 'game_model.dart';
import 'hit_me_button.dart';
import 'button_styles.dart';

void main() {
  runApp(const TiroAlBlancoApp());
}

class TiroAlBlancoApp extends StatelessWidget {
  const TiroAlBlancoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiro al blanco',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GameModel _gameModel;

  @override
  void initState() {
    super.initState();
    _gameModel = GameModel(_newTargetValue());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0, top: 32.0),
                child: ScoreWidget(targetValue: _gameModel.target),
              ),
              SliderControl(gameModel: _gameModel),
              GameControls(
                totalScore: _gameModel.totalScore,
                gameNumber: _gameModel.round,
                onRestart: () {
                  startNewGame();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: HitMeButton(
                  onPressed: () {
                    _showAlert(context);
                  },
                  text: 'Disparar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _difference() => (_gameModel.target - _gameModel.current).abs();

  int _newTargetValue() => Random().nextInt(100) + 1;

  void startNewGame() {
    setState(() {
      _gameModel.totalScore = GameModel.scoreStart;
      _gameModel.round = GameModel.roundStart;
      _gameModel.current = GameModel.sliderStart;
      _gameModel.target = _newTargetValue();
    });
  }

  int _pointsForCurrentRound() {
    const maxPoints = 100;
    return maxPoints - _difference();
  }

  String _alertTitle() {
    var difference = _difference();
    if (difference == 0) {
      return 'Perfecto';
    } else if (difference < 5) {
      return 'Casi perfecto';
    } else if (difference < 10) {
      return 'Muy bien';
    } else if (difference < 20) {
      return 'Bien';
    } else {
      return 'Puedes hacerlo mejor';
    }
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_alertTitle(), textAlign: TextAlign.center),
          content: Text('El objetivo era: ${_gameModel.target} \n'
              'Tu punteria fue de: ${_gameModel.current}\n'
              'Tu puntuación total es: ${_pointsForCurrentRound()}\n'
              'Puntos extra: ${_gameModel.extraPoints}'),
          actions: <Widget>[
            StyledButton(
              icon: Icons.close,
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _gameModel.totalScore +=
                      _pointsForCurrentRound() + _gameModel.extraPoints;
                  _gameModel.round++;
                  _gameModel.target = _newTargetValue();
                });
              },
            ),
          ],
          elevation: 5,
        );
      },
    );
  }
}
