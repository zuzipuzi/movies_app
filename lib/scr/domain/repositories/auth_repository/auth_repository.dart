import 'package:movies_app/scr/domain/entities/registration_params.dart';

abstract class AuthRepository {
  //Future<void> logIn(LoginParams params);

  Future<void> register(RegistrationParams params);

  Future<bool> userIsLogged();

  Future<void> logOut();
}
