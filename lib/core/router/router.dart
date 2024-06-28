import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_clean_architecture/presentation/view/home/home_view.dart';
import 'package:test_clean_architecture/presentation/view/menu_detail/menu_detail_view.dart';

import '../../presentation/view/menu_favorite/menu_favorite_view.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch(settings.name){
      case '/home_view':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const HomeView(),
        );
      case '/menu_detail_view':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            final argument =  settings.arguments as int;
            return MenuDetailView(menuId: argument);
          },
        );
      case '/menu_favorite_view':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            return const MenuFavoriteView();
          },
        );
      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}