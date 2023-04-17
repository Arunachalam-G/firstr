import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BuildType {
  final InheritedWidget appConfig;
  final String buildType;

  BuildType({
    required this.buildType,
    required this.appConfig,
  });
}

enum DefualtConfig {
  debug,
  release,
  adhoc,
  staging,
}

extension ConfigName on DefualtConfig {
  static const _configList = [
    'debug',
    'release',
    'adhoc',
    'staging',
  ];

  String get name => _configList[index];
}

class Flavour {
  static const MethodChannel _channel = MethodChannel(
    'com.vignesh.flavour',
  );
  static late InheritedWidget _currentAppConfiguration;
  static late String _currentBuildType;

  static Future<String?> get _getBuildTypeFromPlatform async =>
      await _channel.invokeMethod(
        'BuildType',
      );

  static InheritedWidget get instance => _currentAppConfiguration;

  static String get getBuildType => _currentBuildType;

  static Future<InheritedWidget> buildSetup({
    required InheritedWidget debug,
    required InheritedWidget adhoc,
    required InheritedWidget staging,
    required InheritedWidget release,
    DefualtConfig defualtConfig = DefualtConfig.debug,
    List<BuildType>? otherBuildType,
  }) async {
    _currentBuildType = await _getBuildTypeFromPlatform ?? defualtConfig.name;
    if (_currentBuildType == DefualtConfig.debug.name) {
      _currentAppConfiguration = debug;
    } else if (_currentBuildType == DefualtConfig.adhoc.name) {
      _currentAppConfiguration = adhoc;
    } else if (_currentBuildType == DefualtConfig.staging.name) {
      _currentAppConfiguration = staging;
    } else if (_currentBuildType == DefualtConfig.release.name) {
      _currentAppConfiguration = release;
    } else {
      InheritedWidget? customBuildType;
      if (otherBuildType != null) {
        for (var buildData in otherBuildType) {
          if (buildData.buildType == _currentBuildType) {
            customBuildType = buildData.appConfig;
            _currentAppConfiguration = customBuildType;
            break;
          }
        }
      }
      if (customBuildType == null) {
        switch (defualtConfig) {
          case DefualtConfig.debug:
            _currentAppConfiguration = debug;
            break;
          case DefualtConfig.release:
            _currentAppConfiguration = release;
            break;
          case DefualtConfig.adhoc:
            _currentAppConfiguration = adhoc;
            break;
          case DefualtConfig.staging:
            _currentAppConfiguration = staging;
            break;
        }
      }
    }
    return _currentAppConfiguration;
  }
}
