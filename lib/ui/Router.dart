import 'package:flutter/material.dart';

import 'package:motel_app/ui/screens/FavoriteMotelsScreen.dart';
import 'package:motel_app/ui/screens/HomeScreen.dart';
import 'package:motel_app/ui/screens/MapScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen()
        );
      
      case '/favoriteMotels':
        return MaterialPageRoute(
          builder: (_) => FavoriteMotelsScreen()
        );
      
      case '/map':
        return MaterialPageRoute(
          builder: (_) => MapScreen()
        );
      
      default: 
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Ninguna ruta definida para ${settings.name}'),
            )
          )
        );
    }
  }
}