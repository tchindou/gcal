import 'package:flutter/material.dart';
import 'package:gcal/view/export-view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Vous pouvez définir vos propres routes et logique ici
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WalkthroughScreen());
      case '/landing': // J'ai changé la valeur pour éviter la duplication
        return MaterialPageRoute(builder: (_) => Landing());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
