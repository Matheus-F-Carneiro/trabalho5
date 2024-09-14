import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String? label;
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  TextFieldComponent(
      {this.label,
      this.hintText,
      this.controller,
      this.icon,
      this.textInputType});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? null,
      decoration: InputDecoration(
        labelText: label ?? null,
        hintText: hintText ?? null,
        labelStyle: TextStyle(color: Colors.blue[200]),
        border: OutlineInputBorder(),
        icon: Icon(icon),
      ),
      style: TextStyle(color: Colors.blue[200], fontSize: 15.0),
      keyboardType: textInputType ?? TextInputType.text,
    );
  }
}
