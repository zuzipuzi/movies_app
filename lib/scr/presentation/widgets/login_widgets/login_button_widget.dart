import 'package:flutter/material.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget({Key? key, required this.onPressed})
      : super(key: key);
  final void Function()? onPressed;

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120, 40),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: widget.onPressed,
    );
  }
}
