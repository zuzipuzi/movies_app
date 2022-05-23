import 'package:flutter/material.dart';
import 'package:movies_app/scr/presentation/base/cubit_base.dart';
import 'package:movies_app/scr/presentation/features/login/login_cubit.dart';
import 'package:movies_app/scr/presentation/features/login/login_state.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends CubitState<Login, LoginState, LoginCubit> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        title: Text(
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
              SizedBox(height: 30),
              _buildLogo(),
              SizedBox(height: 30),
              _buildTextFields(),
              SizedBox(height: 30),
              LoginButtonWidget,
              SizedBox(height: 10),
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

  Widget _buildTextFields(){


}

}
