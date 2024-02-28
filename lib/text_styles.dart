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
