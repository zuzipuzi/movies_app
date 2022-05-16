import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/scr/domain/entities/registration_params.dart';
import 'package:movies_app/scr/domain/interactors/registration/registration_interactor.dart';

class RegistrationCubit extends Cubit{
  RegistrationCubit(initialState, this._registrationInteractor) : super(initialState);
  final RegistrationInteractor _registrationInteractor;
  void _checkAllFieldsFilled() {
  }
  void onEmailChanged(String email) {
  }
  void onPasswordChanged(String password){
  }
  void onConfirmPasswordChanged(String password){
  }
  Future<void> onRegistration(RegistrationParams params) async{}

}