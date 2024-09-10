import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/utils/theme.dart';
import 'package:simple_tax/view/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SimplexTax',
      theme: basicTheme(),
      themeMode: ThemeMode.light,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('np', ''),
      ],
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}