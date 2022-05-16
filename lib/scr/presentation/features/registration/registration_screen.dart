import 'package:flutter/material.dart';
import 'package:movies_app/scr/presentation/features/login/login.dart';

import '../../../domain/entities/registration_params.dart';




class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  static const registration = '/registration';
  @override
  _Registration createState() => _Registration();
}

class _Registration extends State<Registration> {
  bool _show = true;
  bool _showRepeat = true;
  final List _county = [
    'Argentina',
    'Australia',
    'Austria',
    'Brazil',
    'Canada',
    'China',
    'France',
    'Germany',
    'Poland',
    'Switzerland',
    'Ukraine',
    'USA'
  ];
  String? _selectCountry;

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegistrationParams newUser = RegistrationParams();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              onSaved: (value) => newUser.name = value,
              validator: _validateName,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Your full name',
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _nameController.clear();
                    }),
                icon: Icon(
                  Icons.person_pin,
                  color: Colors.pinkAccent.shade100,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              onSaved: (value) => newUser.surname = value,
              validator: _validateSurname,
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Full Surname',
                hintText: 'Your full surname',
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _surnameController.clear();
                    }),
                icon: Icon(
                  Icons.person_pin,
                  color: Colors.pinkAccent.shade100,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              onSaved: (value) => newUser.email = value,
              validator: _validateEmail,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@example.com',
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _emailController.clear();
                    }),
                icon: Icon(
                  Icons.mark_email_read_outlined,
                  color: Colors.pinkAccent.shade100,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField(
              validator: (val) {
                return val == null ? 'Please, select your country' : null;
              },
              decoration: InputDecoration(
                labelText: 'Country',
                hintText: 'Select your country',
                prefixIcon: Icon(
                  Icons.accessibility_new,
                  color: Colors.pinkAccent.shade100,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              items: _county.map((country) {
                return DropdownMenuItem(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              onChanged: (country) {
                print(country);
                setState(() {
                  _selectCountry = country as String?;
                  newUser.country = country;
                });
              },
              value: _selectCountry,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              validator: _validatePassword,
              controller: _passwordController,
              maxLength: 20,
              obscureText: _show,
              decoration: InputDecoration(
                labelText: 'Password',
                helperText: 'Enter min 5 characters',
                suffixIcon: IconButton(
                  icon: Icon(
                    _show ? Icons.visibility : Icons.visibility_off,
                    color: Colors.pinkAccent.shade100,
                  ),
                  splashColor: Colors.lightBlueAccent.shade100,
                  onPressed: () {
                    setState(() {
                      _show = !_show;
                    });
                  },
                ),
                icon: Icon(
                  Icons.lock_outlined,
                  color: Colors.pinkAccent.shade100,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              validator: _validateConfirmPassword,
              controller: _confirmPasswordController,
              maxLength: 20,
              obscureText: _showRepeat,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                helperText: 'Repeat, please',
                suffixIcon: IconButton(
                  icon: Icon(
                    _showRepeat ? Icons.visibility : Icons.visibility_off,
                    color: Colors.pinkAccent.shade100,
                  ),
                  splashColor: Colors.lightBlueAccent.shade100,
                  onPressed: () {
                    setState(() {
                      _showRepeat = !_showRepeat;
                    });
                  },
                ),
                icon: Icon(
                  Icons.lock_outlined,
                  color: Colors.pinkAccent.shade100,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _recordForm,
              child: const Text('Record'),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _recordForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(name: _nameController.text);
      print('Name:${_nameController.text}');
      print('Surname:${_surnameController.text}');
      print('Email:${_emailController.text}');
      print('Country:$_selectCountry');
    }
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'^[A-Za-zА-Яа-я]+$');
    if (value!.isEmpty) {
      return "Name is required";
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter only letters';
    } else {
      return null;
    }
  }

  String? _validateSurname(String? value) {
    final _nameExp = RegExp(r'^[A-Za-zА-Яа-я]+$');
    if (value!.isEmpty) {
      return "Surname is required";
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter only letters';
    } else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Email is required";
    } else if (!_emailController.text.contains('@')) {
      return 'Email entered incorrectly';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passwordController.text.length < 5) {
      return "Enter min 5 characters";
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (_confirmPasswordController.text.length < 5) {
      return "Enter min 5 characters";
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  void _showDialog({required String name}){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('Registration successful',style: TextStyle(fontWeight: FontWeight.w900),),
            content: Text(
                '$name, confirm that form is correct'
            ),
            actions: [
              TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Close")),
              TextButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),),);},
                  child: const Text("Okey", style: TextStyle(fontWeight: FontWeight.w700),))
            ],
          );
        }
    );
  }
}
