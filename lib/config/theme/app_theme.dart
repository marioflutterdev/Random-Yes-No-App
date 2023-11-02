import 'package:flutter/material.dart';

const Color _customColor = Color(0xff5c11D4);
const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.brown,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 6,
  }) : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1);

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
