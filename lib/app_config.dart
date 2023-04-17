import 'package:flutter/material.dart';

/// You can setup Debug, Staging and Release environment variables here
@immutable
class AppConfig extends InheritedWidget {
  final String baseUrl;

  const AppConfig({
    Key? key,
    required this.baseUrl,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant AppConfig oldWidget) =>
      oldWidget.baseUrl != baseUrl;
}
