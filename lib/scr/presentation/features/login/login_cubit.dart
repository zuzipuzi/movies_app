import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/scr/domain/entities/login_params.dart';
import 'package:movies_app/scr/domain/exception/incorrect_email_or_password.dart';
import 'package:movies_app/scr/domain/interactors/auth/log_in_interactor.dart';
import 'package:movies_app/scr/presentation/features/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginInteractor) : super(const LoginState());
  final LogInInteractor _loginInteractor;

  void _checkAllFieldsFilled() {
    emit(state.copyWith(
        allFieldsFilled: state.email.isNotEmpty && state.password.isNotEmpty));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(
      email: email,
      incorrectEmail: false,
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

  Future<void> onLogin(LoginParams params) async {
    try {
      final params = LoginParams(email: state.email, password: state.password);
      emit(state.copyWith(allFieldsFilled: true));
      await _loginInteractor.call(params);
    } on IncorrectEmailOrPasswordException {
      emit(state.copyWith(incorrectPassword: true, incorrectEmail: true));
    }
  }
}
