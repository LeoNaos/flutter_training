import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // Properties
  final String labelText;
  final TextEditingController controller;

  // Constructor
  CustomTextField({@required this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          labelText: labelText),
    );
  }
}
