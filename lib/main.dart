import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'score_widget.dart';
import 'slider_control.dart';
import 'game_controls.dart';
import 'game_model.dart';

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
    return const MaterialApp(
      title: 'Tiro al blanco',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GameModel _gameModel;

  @override
  void initState() {
    super.initState();
    _gameModel = GameModel(50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ScoreWidget(targetValue: 10),
            SliderControl(gameModel: _gameModel),
            GameControls(
                totalScore: _gameModel.totalScore,
                gameNumber: _gameModel.round),
            TextButton(
              child: Text('Disparar', style: TextStyle(fontSize: 20)),
              onPressed: () {
                _showAlert();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text('Tu puntuación es: ${_gameModel.current}'),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 5,
        );
      },
    );
  }
}
