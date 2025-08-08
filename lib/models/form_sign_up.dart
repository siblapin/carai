import 'package:flutter/material.dart';

class FormSignUp extends StatelessWidget {
  final ValueChanged<String> onCommentChanged;
  const FormSignUp(
      {super.key, required this.name, required this.onCommentChanged});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
          onChanged: onCommentChanged,
          cursorColor: Colors.orange,
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Color(0xFFE2A5C9A)),
            isDense: true,
            labelText: name,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                  color: Colors.orange, width: 2.0), // Обводка при фокусе
            ),
          )),
    );
  }
}
