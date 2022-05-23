import 'package:movies_app/scr/domain/interactors/base/base_interactor.dart';
import 'package:movies_app/scr/domain/repositories/auth_repository/auth_repository.dart';

class LogOutInteractor extends BaseNoInputInteractor<void> {
  LogOutInteractor(this.repository);

  AuthRepository repository;

  @override
  Future<void> call() async {
    return repository.logOut();
  }
}
