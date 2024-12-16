import 'package:flutter/material.dart';

class TextFont extends StatelessWidget {
  const TextFont(this.textName, {super.key});
  final String textName;
  @override
  Widget build(BuildContext context) {
    return Text(
      textName,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
      ),
    );
  }
}
