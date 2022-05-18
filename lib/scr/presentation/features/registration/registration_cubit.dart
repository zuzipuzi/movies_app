import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/scr/domain/entities/registration_params.dart';
import 'package:movies_app/scr/domain/exception/email_is_already_used.dart';
import 'package:movies_app/scr/domain/interactors/registration/registration_interactor.dart';
import 'package:movies_app/scr/presentation/features/registration/registration_state.dart';
import 'package:movies_app/scr/presentation/utils/validators.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._registrationInteractor) : super(RegistrationState());
  final RegistrationInteractor _registrationInteractor;

  void _checkAllFieldsFilled() {
    emit(state.copyWith(
        allFieldsFilled: state.name.isNotEmpty &&
            state.surname.isNotEmpty &&
            state.email.isNotEmpty &&
            state.country.isNotEmpty &&
            state.password.isNotEmpty &&
            state.confirmPassword.isNotEmpty));
  }

  void onNameChanged(String name) {
    emit(state.copyWith(
      name: name,
      incorrectName: false,
    ));
    _checkAllFieldsFilled();
  }

  void onSurnameChanged(String surname) {
    emit(state.copyWith(
      name: surname,
      incorrectSurname: false,
    ));
    _checkAllFieldsFilled();
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(
      email: email,
      incorrectEmail: false,
    ));
    _checkAllFieldsFilled();
  }

  void onCountryChanged(String country) {
    emit(state.copyWith(
      country: country,
      incorrectCountry: false,
    ));
    _checkAllFieldsFilled();
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(
      password: password,
      incorrectPassword: false,
    ));
    _checkAllFieldsFilled();
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      incorrectConfirmPassword: false,
    ));
    _checkAllFieldsFilled();
  }

  Future<void> onRegistration(RegistrationParams params) async {
    final nameValidate = validateName(state.name);
    final surnameValidate = validateSurname(state.surname);
    final emailValidate = validateEmail(state.email);
    final countryValidate = validateCountry(state.country);
    final passwordValidate = validatePassword(state.password);
    final confirmPasswordValidate =
        validateConfirmPassword(state.confirmPassword);
    if (nameValidate &&
        surnameValidate &&
        emailValidate &&
        countryValidate &&
        passwordValidate &&
        confirmPasswordValidate) {
      try {
        final params = RegistrationParams(
            name: state.name,
            surname: state.surname,
            email: state.email,
            country: state.country,
            password: state.password,
            confirmPassword: state.confirmPassword);
        emit(state.copyWith(allFieldsFilled: true));
        await _registrationInteractor.call(params);
        emit(state.copyWith(allFieldsValidate: true));
      } on EmailIsAlreadyUsedException {
        emit(state.copyWith(incorrectEmail: true));
      } finally {
        emit(state.copyWith(allFieldsFilled: false));
      }
    } else {
      emit(state.copyWith(
        incorrectEmail: !emailValidate,
        incorrectPassword: !passwordValidate,
        incorrectConfirmPassword: !confirmPasswordValidate,
      ));
    }
  }
}
