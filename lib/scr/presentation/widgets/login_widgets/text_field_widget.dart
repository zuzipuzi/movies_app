import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.validator,
    required this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final dynamic validator;
  final IconButton suffixIcon;

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
        labelText: 'Email',
        hintText: 'example@example.com',
        suffixIcon: widget.suffixIcon,
        icon: Icon(Icons.mark_email_read_outlined,
            color: Colors.pinkAccent.shade100),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        ),
      ),
    );
  }
}
