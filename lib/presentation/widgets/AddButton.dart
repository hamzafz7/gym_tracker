import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  AddButton({super.key, required this.onpressed});
  Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpressed,
      backgroundColor: Colors.grey[800],
      child: const Icon(Icons.add),
    );
  }
}
