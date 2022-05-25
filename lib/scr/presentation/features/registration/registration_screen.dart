import 'package:flutter/material.dart';
import 'package:movies_app/scr/domain/entities/registration_params.dart';
import 'package:movies_app/scr/presentation/base/cubit_base.dart';
import 'package:movies_app/scr/presentation/features/registration/registration_cubit.dart';
import 'package:movies_app/scr/presentation/features/registration/registration_state.dart';
import 'package:movies_app/scr/presentation/utils/validators.dart';
import 'package:movies_app/scr/presentation/widgets/registration_widgets/dropdown_button.dart';
import 'package:movies_app/scr/presentation/widgets/registration_widgets/password_form_field.dart';
import 'package:movies_app/scr/presentation/widgets/registration_widgets/text_field_widget.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState
    extends CubitState<Registration, RegistrationState, RegistrationCubit> {
  final _formKey = GlobalKey<FormState>();
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
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegistrationParams newUser = RegistrationParams(
      name: '',
      surname: '',
      email: '',
      country: '',
      password: '',
      confirmPassword: '');

  @override
  void initParams(BuildContext context) {
    final state = cubit(context).state;
    _nameController
      ..text = state.name
      ..addListener(() {
        cubit(context).onNameChanged(_nameController.text);
      });
    _surnameController
      ..text = state.surname
      ..addListener(() {
        cubit(context).onSurnameChanged(_surnameController.text);
      });
    _emailController
      ..text = state.email
      ..addListener(() {
        cubit(context).onEmailChanged(_emailController.text);
      });
    _countryController
      ..text = state.country
      ..addListener(() {
        cubit(context).onCountryChanged(_countryController.text);
      });
    _passwordController
      ..text = state.password
      ..addListener(() {
        cubit(context).onPasswordChanged(_passwordController.text);
      });
    _confirmPasswordController
      ..text = state.confirmPassword
      ..addListener(() {
        cubit(context)
            .onConfirmPasswordChanged(_confirmPasswordController.text);
      });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: observeState(builder: (context, state) {
        return _buildRegisterBody(context);
      }),
    );
  }

  Widget _buildRegisterBody(BuildContext context) {
    return observeState(
      builder: (context, state) => Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [_buildTextFields(state)],
        ),
      ),
    );
  }

  Widget _buildTextFields(RegistrationState state) {
    return observeState(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _nameTextField(state),
          const SizedBox(height: 16.0),
          _surnameTextField(state),
          const SizedBox(height: 16.0),
          _emailTextField(state),
          const SizedBox(height: 16.0),
          _countryDropdownButton(state),
          const SizedBox(height: 16.0),
          _passwordFormField(state),
          const SizedBox(height: 16.0),
          _confirmPasswordFormField(state),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _showDialog,
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
    );
  }

  Widget _nameTextField(RegistrationState state) {
    return TextFieldWidget(
      controller: _nameController,
      validator: validateName,
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
    );
  }

  Widget _surnameTextField(RegistrationState state) {
    return TextFieldWidget(
      controller: _surnameController,
      validator: validateSurname,
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
    );
  }

  Widget _emailTextField(RegistrationState state) {
    return TextFieldWidget(
      controller: _emailController,
      validator: validateEmail,
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
    );
  }

  Widget _countryDropdownButton(RegistrationState state) {
    return DropdownButtonCountry(
        items: _county.map((country) {
          return DropdownMenuItem(
            child: Text(country),
            value: country,
          );
        }).toList(),
        onChanged: (country) {
          setState(() {
            _selectCountry = country as String?;
            newUser.country = country!;
          });
        },
        value: _selectCountry);
  }

  Widget _passwordFormField(RegistrationState state) {
    return PasswordFormField(
      controller: _passwordController,
      validator: validatePassword,
      obscureText: _show,
      labelText: 'Password',
      helperText: 'Enter min 5 characters',
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _show = !_show;
          });
        },
        icon: Icon(
          _show ? Icons.visibility : Icons.visibility_off,
          color: Colors.pinkAccent.shade100,
        ),
        splashColor: Colors.lightBlueAccent.shade100,
      ),
    );
  }

  Widget _confirmPasswordFormField(RegistrationState state) {
    return PasswordFormField(
      controller: _confirmPasswordController,
      validator: validateConfirmPassword,
      obscureText: _showRepeat,
      labelText: 'Confirm Password',
      helperText: 'Repeat, please',
      suffixIcon: IconButton(
        splashColor: Colors.lightBlueAccent.shade100,
        onPressed: () {
          setState(() {
            _showRepeat = !_showRepeat;
          });
        },
        icon: Icon(
          _showRepeat ? Icons.visibility : Icons.visibility_off,
          color: Colors.pinkAccent.shade100,
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Registration successful',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            content: Text('$_nameController, confirm that form is correct'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Close")),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Okay",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ))
            ],
          );
        });
  }
}
