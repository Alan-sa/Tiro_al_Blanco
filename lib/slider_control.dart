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
        padding: EdgeInsets.only(left: 32.0),
        child: Text('1'),
      ),
      Expanded(
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: const RoundedRectSliderTrackShape(),
            trackHeight: 8.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: const RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
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
      ),
      const Padding(
        padding: EdgeInsets.only(right: 60.0),
        child: Text('100'),
      ),
    ]);
  }
}
