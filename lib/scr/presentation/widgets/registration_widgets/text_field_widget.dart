import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key,
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.icon})
      : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)  validator;
  final String labelText;
  final String hintText;
  final IconButton suffixIcon;
  final Icon icon;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        icon: widget.icon,
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
