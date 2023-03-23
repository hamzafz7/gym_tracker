// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.text,
      required this.inputType});
  TextEditingController controller;
  String text;

  TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(hintText: text),
    );
  }
}
