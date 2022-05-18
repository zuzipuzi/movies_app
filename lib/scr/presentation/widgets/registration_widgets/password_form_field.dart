import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({Key? key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.helperText,
    required this.suffixIcon,
    })
      : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String helperText;
  final IconButton suffixIcon;


  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLength: 20,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.helperText,
        suffixIcon: widget.suffixIcon,
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
      ),);
  }
}
