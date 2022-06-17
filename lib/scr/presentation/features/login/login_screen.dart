import 'package:flutter/material.dart';
import 'package:movies_app/scr/presentation/base/cubit_base.dart';
import 'package:movies_app/scr/presentation/features/login/login_cubit.dart';
import 'package:movies_app/scr/presentation/features/login/login_state.dart';
import 'package:movies_app/scr/presentation/utils/validators.dart';
import 'package:movies_app/scr/presentation/widgets/login_button_widget.dart';
import 'package:movies_app/scr/presentation/features/home/home_screen.dart';
import 'package:movies_app/scr/presentation/widgets/password_form_field.dart';
import 'package:movies_app/scr/presentation/widgets/text_field_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends CubitState<Login, LoginState, LoginCubit> {
  final _formKey = GlobalKey<FormState>();
  bool _show = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initParams(BuildContext context) {
    final state = cubit(context).state;
    _emailController
      ..text = state.email
      ..addListener(() {
        cubit(context).onEmailChanged(_emailController.text);
      });
    _passwordController
      ..text = state.password
      ..addListener(() {
        cubit(context).onPasswordChanged(_passwordController.text);
      });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MoviesApp',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: observeState(builder: (context, state) {
          return _buildLoginBody(context);
        }),
      ),
    );
  }

  Widget _buildLoginBody(BuildContext context) {
    return observeState(
        builder: (context, state) =>
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 30),
              _buildLogo(),
              const SizedBox(height: 30),
              _buildTextFields(),
              const SizedBox(height: 10),
              ActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      //потом изменю на pushNamed как сделаю Home
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              _buildSwitchToRegistration(),
            ]));
  }

  Widget _buildLogo() {
    return const Image(
      image: AssetImage('assets/icons/pngegg.png'),
      height: 200,
      width: 200,
    );
  }

  Widget _buildTextFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldWidget(
            controller: _emailController,
            validator: validateEmail,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () {
                _emailController.clear();
              },
            ),
            labelText: 'Email',
            icon: Icon(Icons.mark_email_read_outlined,
                color: Colors.pinkAccent.shade100),
            hintText: "example@example.com",
          ),
          const SizedBox(height: 10),
          PasswordFormField(
            controller: _passwordController,
            validator: validatePassword,
            obscureText: _show,
            suffixIcon: IconButton(
              splashColor: Colors.lightBlueAccent.shade100,
              onPressed: () {
                setState(() {
                  _show = !_show;
                });
              },
              icon: Icon(
                _show ? Icons.visibility : Icons.visibility_off,
                color: Colors.pinkAccent.shade100,
              ),
            ),
            helperText: 'Enter min 5 characters',
            labelText: 'Password',
          )
        ],
      ),
    );
  }

  Widget _buildSwitchToRegistration() {
    return Column(
      children: [
        const Text('No account?'),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/registration');
            },
            child: const Text("Create it here"))
      ],
    );
  }
}
