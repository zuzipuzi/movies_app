class RegistrationParams {
  RegistrationParams(
      {required this.name,
      required this.surname,
      required this.email,
      required this.country,
      required this.password,
      required this.confirmPassword});

  String name;
  String surname;
  String email;
  String country;
  String password;
  String confirmPassword;
}
