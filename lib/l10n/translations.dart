import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  Map<String, Map<String, String>> localizedValues = {};

  Future<void> loadTranslations() async {
    localizedValues['en'] = await _loadLanguageFile('en');
    localizedValues['ne'] = await _loadLanguageFile('ne');
  }

  Future<Map<String, String>> _loadLanguageFile(String lang) async {
    String jsonString = await rootBundle.loadString('assets/lang/$lang.json');
    return Map<String, String>.from(jsonDecode(jsonString));
  }

  @override
  Map<String, Map<String, String>> get keys => localizedValues;
}
