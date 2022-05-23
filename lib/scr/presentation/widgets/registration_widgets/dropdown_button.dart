import 'package:flutter/material.dart';

class DropdownButton extends StatefulWidget {
  const DropdownButton(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.value})
      : super(key: key);

  final dynamic items;
  final dynamic onChanged;
  final dynamic value;

  @override
  State<DropdownButton> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
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
          borderSide: BorderSide(color: Colors.pinkAccent.shade100, width: 2.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        ),
      ),
      onChanged: widget.onChanged,
      items: widget.items,
      value: widget.value,
    );
  }
}
