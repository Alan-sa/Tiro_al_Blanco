import 'package:flutter/material.dart';
import 'text_styles.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({Key? key, required this.targetValue}) : super(key: key);
  final int targetValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Trata de dar en el blanco',
          style: LabelTextStyle.bodyText1(context),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Puntos: $targetValue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              )),
        ),
      ],
    );
  }
}
