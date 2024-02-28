import 'package:flutter/material.dart';
import 'game_model.dart';

class SliderControl extends StatefulWidget {
  const SliderControl({super.key, required this.gameModel});

  final GameModel gameModel;

  @override
  State<SliderControl> createState() => _SliderControlState();
}

class _SliderControlState extends State<SliderControl> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('1'),
      ),
      Expanded(
        child: Slider(
          value: widget.gameModel.current.toDouble(),
          onChanged: (double value) {
            setState(() {
              widget.gameModel.current = value.toInt();
            });
          },
          min: 1,
          max: 100,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('100'),
      ),
    ]);
  }
}
