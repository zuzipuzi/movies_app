import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.incorrectEmail = false,
    this.incorrectPassword = false,
    this.allFieldsFilled = false,
  });

  final String email;
  final String password;
  final bool incorrectEmail;
  final bool incorrectPassword;
  final bool allFieldsFilled;

  LoginState copyWith({
    String? email,
    String? password,
    bool? incorrectEmail,
    bool? incorrectPassword,
    bool? allFieldsFilled,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      incorrectEmail: incorrectEmail ?? this.incorrectEmail,
      incorrectPassword: incorrectPassword ?? this.incorrectPassword,
      allFieldsFilled: allFieldsFilled ?? this.allFieldsFilled,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        incorrectEmail,
        incorrectPassword,
        allFieldsFilled,
      ];
}
