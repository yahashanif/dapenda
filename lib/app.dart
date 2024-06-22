import 'package:dapenda/app/routes.dart';
import 'package:dapenda/themes/themes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: green,
          // primaryColor,
          // ···
          brightness: Brightness.light,
        ),
      ),
      initialRoute: splashRoute,
      onGenerateRoute: AppRoute().generateRoute,
    );
  }
}
