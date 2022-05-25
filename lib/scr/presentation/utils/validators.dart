String? validateName(String? value) {
  final _nameExp = RegExp(r'^[A-Za-zА-Яа-я]+$');
  if (value!.isEmpty) {
    return "Name is required";
  } else if (!_nameExp.hasMatch(value)) {
    return 'Please enter only letters';
  } else {
    return null;
  }
}

String? validateSurname(String? value) {
  final _surnameExp = RegExp(r'^[A-Za-zА-Яа-я]+$');
  if (value!.isEmpty) {
    return "Surname is required";
  } else if (!_surnameExp.hasMatch(value)) {
    return 'Please enter only letters';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return "Email is required";
  } else if (!value.contains('@')) {
    return 'Email entered incorrectly';
  } else {
    return null;
  }
}


String? validatePassword(String? value) {
  if (value!.length < 5) {
    return "Enter min 5 characters";
  } else if (validatePassword(value) != validateConfirmPassword(value)) {
    return 'Passwords do not match';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? value) {
  if (value!.length < 5) {
    return "Enter min 5 characters";
  } else if (validateConfirmPassword(value) != validatePassword(value)) {
    return 'Passwords do not match';
  } else {
    return null;
  }
}

String? validateEmailLogin(String? value){
  if (value != 'admin' && value!.isEmpty ){
    return "Enter 'admin'";
  } else if(value == 'admin'){
    return null;
  }
}

String? validatePasswordLogin(String? value){
  if (value != 'admin' && value!.isEmpty ){
    return "Enter 'admin'";
  } else if(value == 'admin'){
    return null;
  }
}
