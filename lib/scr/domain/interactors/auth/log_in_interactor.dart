import 'package:movies_app/scr/domain/entities/login_params.dart';
import 'package:movies_app/scr/domain/interactors/base/base_interactor.dart';
import 'package:movies_app/scr/domain/repositories/auth_repository/auth_repository.dart';

class LogInInteractor extends BaseInteractor<LoginParams, void> {
  LogInInteractor(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(LoginParams input) async {
    return repository.logIn(input);
  }
}
