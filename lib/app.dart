import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/l10n/app_translations.dart';
import 'package:simple_tax/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_tax/view/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SimplexTax',
      theme: basicTheme(),
      themeMode: ThemeMode.light,
      translations: AppTranslations(),
      locale: Locale('en'),
      fallbackLocale: Locale("en"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('np', ''),
      ],
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
