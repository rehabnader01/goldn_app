import 'package:flutter/material.dart';
import 'package:goldn/core/routing/routes.dart';
import 'package:goldn/features/gold/presentation/screens/gold_screen.dart';
import 'package:goldn/features/silver/presentation/screens/silver_screen.dart';
import '../presentation/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );

      case AppRoutes.goldScreen:
        return MaterialPageRoute(
          builder: (context) {
            return GoldScreen();
          },
        );

      case AppRoutes.silverScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SilverScreen();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("No route defined for ${settings.name}"),
              ),
            );
          },
        );
    }
  }
}
