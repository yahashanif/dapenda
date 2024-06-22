import 'package:dapenda/pages/data_ulang/data_ulang_screen.dart';
import 'package:dapenda/pages/home/home_screen.dart';
import 'package:dapenda/pages/login/login_screen.dart';
import 'package:dapenda/pages/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../pages/splash_screen/splash_screen.dart';

const String splashRoute = '/';

const String onBoardingRoute = '/onBoarding';

const String loginRoute = '/login';

const String homeRoute = '/home';

const String dataUlangRoute = '/data-ulang';

class AppRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case onBoardingRoute:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case dataUlangRoute:
        return MaterialPageRoute(builder: (context) => const DataUlangScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const Scaffold()));
    }
  }
}
