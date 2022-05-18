bool validateName(String value) {
  final _nameExp = RegExp(r'^[A-Za-zА-Яа-я]+$');
  if (value.isEmpty) {
    return false;
  } else {
    (!_nameExp.hasMatch(value));
    return false;
  }
}

bool validateSurname(String value) {
  final _nameExp = RegExp(r'^[A-Za-zА-Яа-я]+$');
  if (value.isEmpty) {
    return false;
  } else {
    (!_nameExp.hasMatch(value));
    return false;
  }
}

bool validateEmail(String value) {
  if (value.isEmpty) {
    return false;
  } else {
    (value.contains('@'));
    return false;
  }
}

bool validateCountry(String value) {
  (value.isEmpty);
  return false;
}

bool validatePassword(String value) {
  final password = value.trim();
  if (password.length < 5) {
    return false;
  } else {
    return false;
  }
}

bool validateConfirmPassword(String value) {
  final confirmPassword = value.trim();
  if (confirmPassword.length < 5) {
    return false;
  } else {
    (confirmPassword.trim() != validatePassword(value.trim()));
    return false;
  }
}
