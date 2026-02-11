
import 'package:flutter/material.dart';
import 'package:goldn/core/routing/routes.dart';
import '../presentation/home_screen.dart' ;

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.HomeScreen:

        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) { return Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          );

          },
        );
    }
  }
}
