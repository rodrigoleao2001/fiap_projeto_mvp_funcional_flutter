import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String?) onSaved;
  final String? Function(String?) validator;

  CustomTextFormField({
    required this.label,
    required this.icon,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
