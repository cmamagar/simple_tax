import 'package:flutter/material.dart';
import 'package:simple_tax/app.dart';
import 'package:simple_tax/l10n/translations.dart';

// void main() {
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MyTranslations translations = MyTranslations();
  await translations.loadTranslations();  // Ensure translations are loaded

  runApp(MyApp(translations));
}
