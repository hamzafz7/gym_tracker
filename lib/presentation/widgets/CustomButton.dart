// ignore: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.onpressed,
      required this.h,
      required this.w});
  String text;
  Function()? onpressed;
  double h;
  double w;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        height: h * 0.06,
        minWidth: w * 0.7,
        onPressed: onpressed,
        color: Colors.black,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
