import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dam_u2_appavanzada/appavanzada.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: AdaptiveThemeMode.light,
      builder: (theme,darkTheme){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "App Avanzada",
          theme: theme,
          darkTheme: darkTheme,
          home: appAvanzada(),
        );
      },
    );
  }
}

