import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function validatorFun;
  final Function savedFun;
  CustomTextField({this.label, this.validatorFun, this.savedFun});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validatorFun(value),
      onSaved: (value) => savedFun(value),
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
