import 'dart:async';

import 'package:flavour/flavour.dart';
import 'package:flutter/material.dart';

import 'app_config.dart';
import 'src/app.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //TODO: After firebase server setup, uncomment the below line
      //await _firebaseCrashlyticsSetup();
      runApp(
        await Flavour.buildSetup(
          debug: const AppConfig(
            baseUrl: 'development base url',
            child: MyApp(),
          ),
          adhoc: const AppConfig(
            baseUrl: 'adhoc base url',
            child: MyApp(),
          ),
          staging: const AppConfig(
            baseUrl: 'staging base url',
            child: MyApp(),
          ),
          release: const AppConfig(
            baseUrl: 'release base url',
            child: MyApp(),
          ),
        ),
      );
    },
    (error, stack) {
      /// Uncomment below line for FirebaseCrashlytics error record and import firebase plugin
      ///
      //FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

/// Uncomment below function for initializing Firebase and import firebase plugin
///
// Future _firebaseCrashlyticsSetup() async {
//   await Firebase.initializeApp();
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//   return;
// }
