import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/scr/data/repositories/mock_repository.dart';
import 'package:movies_app/scr/domain/interactors/auth/log_in_interactor.dart';
import 'package:movies_app/scr/domain/interactors/auth/registration_interactor.dart';
import 'package:movies_app/scr/presentation/features/login/login_cubit.dart';
import 'package:movies_app/scr/presentation/features/login/login_screen.dart';
import 'package:movies_app/scr/presentation/features/registration/registration_cubit.dart';
import 'package:movies_app/scr/presentation/features/registration/registration_screen.dart';

class Routes {
  static const login = '/';
  static const registration = '/registration';
  static const home = '/home';
  static const movieDetails = '/movieDetails';
  static const favorites = '/favorites';
  static const profile = 'profile';
  static const settings = 'settings';
  static const search = '/search';
}

final _routes = <String, Widget Function(BuildContext)>{
  Routes.registration: (context) => BlocProvider<RegistrationCubit>(
        create: (BuildContext context) =>
            RegistrationCubit(RegistrationInteractor(MockRepository())),
        child: const Registration(),
      ),
  Routes.login: (context) => BlocProvider<LoginCubit>(
        create: (BuildContext context) =>
            LoginCubit(LogInInteractor(MockRepository())),
        child: const Login(),
      ),
};

Route onGenerateRoute(RouteSettings settings) {
  final builder = _routes[settings.name];
  assert(builder != null, 'Non-existing route was requested');
  return MaterialPageRoute(builder: builder!, settings: settings);
}
