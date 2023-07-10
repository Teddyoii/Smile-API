// ignore_for_file: non_constant_identifier_names


import 'package:flutter/material.dart';

class AppKeys {
  AppKeys._();

  //static String get API_KEY => AppConfiguration.instance.apiKey;


  static GlobalKey<ScaffoldMessengerState> get SCAFFOLD_MESSENGER_KEY =>
      _SCAFFOLD_MESSENGER_KEY;

  // Generated finals
  static final GlobalKey<ScaffoldMessengerState> _SCAFFOLD_MESSENGER_KEY =
      GlobalKey();
}