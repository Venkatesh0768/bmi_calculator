import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key,
      required this.name,
      required this.onTap,
      required this.colour});

  final VoidCallback onTap;
  final String name;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: colour,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
