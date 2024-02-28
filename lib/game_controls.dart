import 'package:flutter/material.dart';

class GameControls extends StatelessWidget {
  const GameControls(
      {super.key, required this.totalScore, required this.gameNumber});

  final int totalScore;
  final int gameNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: null,
          child: Text('Reiniciar', style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Tu puntuación: ', style: TextStyle(fontSize: 20)),
              Text('0', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Partida nº: ', style: TextStyle(fontSize: 20)),
              Text('0', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        TextButton(
          onPressed: null,
          child: Text('Más información', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
