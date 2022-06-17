import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({Key? key, required this.onPressed})
      : super(key: key);
  final void Function()? onPressed;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
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
