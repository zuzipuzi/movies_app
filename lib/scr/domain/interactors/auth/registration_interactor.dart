import 'package:movies_app/scr/domain/entities/registration_params.dart';
import 'package:movies_app/scr/domain/interactors/base/base_interactor.dart';
import 'package:movies_app/scr/domain/repositories/auth_repository/auth_repository.dart';

class RegistrationInteractor extends BaseInteractor<RegistrationParams, void> {
  RegistrationInteractor(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(RegistrationParams input) async {
    return repository.register(input);
  }
}
