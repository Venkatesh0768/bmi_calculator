import 'package:flutter/material.dart';
import 'BottomButton.dart';

const cardColor = Color(0xFF1D1E33);
const bottomCardColor = Color(0xFFEB1555);

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.calculationBMI,
      required this.result,
      required this.interpolation});

  final String calculationBMI;
  final String result;
  final String interpolation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: const Text(""),
      ),
      body: Column(
        children: [
          const Text(
            "BMI Results",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12.0),
              height: 500.0,
              width: 500.0,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    calculationBMI,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100.0,
                    ),
                  ),
                  Text(
                    interpolation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              name: "RE-CALCULATE",
              colour: bottomCardColor,
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
