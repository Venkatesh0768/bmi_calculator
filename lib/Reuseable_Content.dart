import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard(this.colour, this.cardChild, {super.key});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      height: 200.0,
      width: 170.0,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
