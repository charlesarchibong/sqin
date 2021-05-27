import 'package:flutter/material.dart';
import 'package:sqin/constant/routes.dart';
import 'package:sqin/ui/views/homepage.dart';

/// Generate routes for navigation
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.homePageView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePageView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
