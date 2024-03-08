import 'package:flutter/material.dart';

class LabelTextStyle {
  static TextStyle? bodyText1(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          letterSpacing: 2.0,
        );
  }
}

class ScoreNumberTextStyle {
  static TextStyle? headLine4(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.black,
        );
  }
}

class TargetTextStyle {
  static TextStyle? bodyText1(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 32.0,
          color: Colors.black,
        );
  }
}
