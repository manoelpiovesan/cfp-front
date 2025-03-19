import 'package:flutter/material.dart';

///
///
///
class Config {
  String get baseUrl => 'http://localhost:8080';

  String get appName => 'Call for Papers';

  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.grey,
        ),
        useMaterial3: false,
      );

  /// Singleton factory
  factory Config() => _instance;

  Config._privateConstructor();

  static final Config _instance = Config._privateConstructor();
}
