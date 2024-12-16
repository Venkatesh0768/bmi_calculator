import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent(this.icon, this.label, {super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(color: Color(0XFF8D8E98), fontSize: 18.0),
        )
      ],
    );
  }
}
