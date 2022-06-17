import 'package:movies_app/scr/domain/interactors/base/base_interactor.dart';
import 'package:movies_app/scr/domain/repositories/auth_repository/auth_repository.dart';

class CheckUserAuthStatus extends BaseNoInputInteractor<bool> {
  CheckUserAuthStatus(this.repository);

  final AuthRepository repository;

  @override
  Future<bool> call() async {
    return repository.userIsLogged();
  }
}
