import 'package:flutter/material.dart';

class Routes {
  static const splashScreen = '/';
  static const login = '/login';
  static const registration = '/registration';
  static const movieTape = '/movieTape';
  static const movieDetails = '/movieDetails';
  static const favorites = '/favorites';
  static const profile = 'profile';
  static const settings = 'settings';
  static const search = '/search';
}

final _routes = <String, Widget Function(BuildContext)>{};

Route onGenerateRoute(RouteSettings settings) {
  final builder = _routes[settings.name];
  assert(builder != null, 'Non-existing route was requested');
  return MaterialPageRoute(builder: builder!, settings: settings);
}
