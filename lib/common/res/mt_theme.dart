import 'package:flutter/material.dart';

import 'mt_colors.dart';
import 'mt_dimension.dart';

/// This extension is used for common theme setup throughout the app.
/// Screen background color, screen center title, app bar theme, text field theme, elevated button theme and primary color has been set here.
/// You can modify them and add additional theme setups.
extension MTThemeData on BuildContext {
  ThemeData mtTheme() {
    final ThemeData base = ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: color(
        cvWhite,
      ),
    );

    InputDecorationTheme inputDecorationTheme(InputDecorationTheme theme) {
      final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          MTDimensions.size_8,
        ),
        borderSide: BorderSide(
          color: color(
            cvGrey,
          ),
        ),
      );
      return theme.copyWith(
        fillColor: color(
          cvWhite,
        ),
        filled: true,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        errorBorder:
            border, // Make change here, If need to show different border in validation error case
        focusedErrorBorder: border,
      );
    }

    AppBarTheme _appBarTheme(AppBarTheme theme) {
      return theme.copyWith(
        centerTitle: true,
      );
    }

    return base.copyWith(
      primaryColor: color(
        cvBlue,
      ),
      inputDecorationTheme: inputDecorationTheme(
        base.inputDecorationTheme,
      ),
      appBarTheme: _appBarTheme(
        base.appBarTheme,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MTDimensions.size_10,
            ),
          ),
        ),
      ),
    );
  }
}
