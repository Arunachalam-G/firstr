import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../common/res/mt_theme.dart';

/// This widget is responsible for showing the initial screen of app.
/// Add your screen route names inside onGenerateRoute switch method.
/// Add app supported languages inside supportedLocales method.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: context.mtTheme(),
      onGenerateRoute: (RouteSettings routeSettings) {
        Widget screen = const Scaffold();
        switch (routeSettings.name) {
          case '/':

            /// Return initial widget here
            break;
          default:
            screen = Scaffold(
              appBar: AppBar(),
            );
        }
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            return screen;
          },
        );
      },
    );
  }
}
