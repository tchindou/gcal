import 'package:flutter/material.dart';
import 'package:gcal/view/export_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Vous pouvez définir vos propres routes et logique ici
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/walk':
        return MaterialPageRoute(builder: (_) => const WalkthroughScreen());
      case '/landing': // J'ai changé la valeur pour éviter la duplication
        return MaterialPageRoute(builder: (_) => const Landing());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const Signup());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/search':
        return MaterialPageRoute(builder: (_) => const Search());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      case '/cart':
        return MaterialPageRoute(builder: (_) => const Cart());
      case '/app':
        return MaterialPageRoute(builder: (_) => const AppScreen());
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
