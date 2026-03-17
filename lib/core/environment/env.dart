import 'dart:convert';
import 'package:flutter/services.dart';

enum Environment { development, staging, production }

class Env {
  Env._();
  static Env? _instance;
  static Env? get instance {
    _instance ??= Env._();
    return _instance;
  }

  static String get apiBaseUrl => _values['apiUrl'] ?? '';
  static String get apiKey => _values['apiKey'] ?? '';
  static String get appName {
    final appName = _values['appName'];
    if (appName == null) {
      print('Waring: appName is not defined in the environmet configuration');
    }
    return _values['appName'] ?? '';
  }

  static Map<String, dynamic> _values = {};

  static late final Environment environment;

  // static String get apiBaseUrl => _values('apiBaseUrl' ?? '' : '')

  static Future<void> initialize() async {
    String fileName;

    switch (environment) {
      case Environment.development:
        fileName = 'lib/env_dev.json';
        break;
      case Environment.staging:
        fileName = 'lib/env_staging.json';
        break;
      case Environment.production:
        fileName = 'lib/env_prod.json';
        break;
    }
    _values = await load(fileName);
  }

  static Future<Map<String, dynamic>> load(String fileName) async {
    return rootBundle.loadString(fileName).then((jsonString) {
      return json.decode(jsonString);
    });
  }
}
