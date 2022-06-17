import 'package:movies_app/scr/domain/entities/login_params.dart';
import 'package:movies_app/scr/domain/entities/registration_params.dart';
import 'package:movies_app/scr/domain/repositories/auth_repository/auth_repository.dart';

class MockRepository extends AuthRepository {
  @override
  Future<bool> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<bool> register(RegistrationParams params) {
    throw UnimplementedError();
  }

  @override
  Future<bool> userIsLogged() {
    throw UnimplementedError();
  }

  @override
  Future<bool> logIn(LoginParams params) async {
    if (params.email == 'admin' && params.password == 'admin') {
      return true;
    } else {
      return false;
    }
  }
}
