import 'package:equatable/equatable.dart';

class RegistrationState extends Equatable {
  RegistrationState(
      {this.name = '',
      this.surname = '',
      this.email = '',
      this.country = '',
      this.password = '',
      this.confirmPassword = '',
      this.incorrectName = false,
      this.incorrectSurname = false,
      this.incorrectEmail = false,
      this.incorrectCountry = false,
      this.incorrectPassword = false,
      this.incorrectConfirmPassword = false,
      this.allFieldsFilled = false,
      this.allFieldsValidate = false});

  String name;
  String surname;
  String email;
  String country;
  String password;
  String confirmPassword;
  bool incorrectName;
  bool incorrectSurname;
  bool incorrectEmail;
  bool incorrectCountry;
  bool incorrectPassword;
  bool incorrectConfirmPassword;
  bool allFieldsFilled;
  bool allFieldsValidate;

  RegistrationState copyWith({
    String? name,
    String? surname,
    String? email,
    String? country,
    String? password,
    String? confirmPassword,
    bool? incorrectName,
    bool? incorrectSurname,
    bool? incorrectEmail,
    bool? incorrectCountry,
    bool? incorrectPassword,
    bool? incorrectConfirmPassword,
    bool? allFieldsFilled,
    bool? allFieldsValidate,
  }) {
    return RegistrationState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      country: country ?? this.country,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      incorrectName: incorrectSurname ?? this.incorrectName,
      incorrectSurname: incorrectSurname ?? this.incorrectSurname,
      incorrectEmail: incorrectEmail ?? this.incorrectEmail,
      incorrectCountry: incorrectCountry ?? this.incorrectCountry,
      incorrectPassword: incorrectPassword ?? this.incorrectPassword,
      incorrectConfirmPassword:
          incorrectConfirmPassword ?? this.incorrectConfirmPassword,
      allFieldsFilled: allFieldsFilled ?? this.allFieldsFilled,
      allFieldsValidate: allFieldsValidate ?? this.allFieldsValidate,
    );
  }

  @override
  List<Object?> get props => [
        name,
        surname,
        email,
        country,
        password,
        confirmPassword,
        incorrectName,
        incorrectSurname,
        incorrectEmail,
        incorrectCountry,
        incorrectPassword,
        incorrectConfirmPassword,
        allFieldsFilled,
        allFieldsValidate,
      ];
}
