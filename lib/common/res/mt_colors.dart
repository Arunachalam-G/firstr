import 'package:flutter/material.dart';

/// To get color of overall app
class MTColors {
  final Color any;
  final Color? light;
  final Color? dark;

  MTColors({
    required this.any,
    this.light,
    this.dark,
  });
}

MTColors get cvWhite => MTColors(
      any: const Color.fromRGBO(255, 255, 255, 1),
    );

MTColors get cvGrey => MTColors(
      any: const Color.fromRGBO(158, 158, 158, 1.0),
    );

MTColors get cvBlue => MTColors(
      any: const Color.fromRGBO(33, 150, 243, 1.0),
    );

extension MTColorsExtension on BuildContext {
  Color get cvPrimary => Theme.of(this).primaryColor;

  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  Color color(
    MTColors lightDarkColor, {
    bool defaultColor = false,
  }) =>
      defaultColor
          ? lightDarkColor.any
          : isLightMode
              ? lightDarkColor.light ?? lightDarkColor.any
              : lightDarkColor.dark ?? lightDarkColor.any;
}
