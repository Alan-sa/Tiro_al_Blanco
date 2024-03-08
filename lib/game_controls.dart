import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'button_styles.dart';

class GameControls extends StatelessWidget {
  const GameControls(
      {super.key,
      required this.totalScore,
      required this.gameNumber,
      required this.onRestart});

  final int totalScore;
  final int gameNumber;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StyledButton(
            icon: Icons.refresh,
            onPressed: () {
              onRestart();
            }),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            children: [
              Text('Tu puntuación total ',
                  style: LabelTextStyle.bodyText1(context)),
              Text('$totalScore',
                  style: ScoreNumberTextStyle.headLine4(context)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Partida nº ', style: LabelTextStyle.bodyText1(context)),
              Text('$gameNumber',
                  style: ScoreNumberTextStyle.headLine4(context)),
            ],
          ),
        ),
        StyledButton(icon: Icons.info, onPressed: () {}),
      ],
    );
  }
}
