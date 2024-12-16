import 'dart:ui';

import 'package:bmi_calculator/Calculation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reuseable_Content.dart';
import 'icon_content.dart';
import 'BottomButton.dart';
import 'ResultPage.dart';
import 'package:bmi_calculator/Calculation.dart';

enum Gender { male, female }

const cardColor = Color(0xFF1D1E33);
const bottomCardColor = Color(0xFFEB1555);
const inactivecolor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactivecolor;
  Color femaleCardColor = inactivecolor;

  int height = 180;
  int weight = 60;
  int Age = 24;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      maleCardColor == cardColor
          ? maleCardColor = inactivecolor
          : maleCardColor = cardColor;
      femaleCardColor = inactivecolor;
    }

    if (gender == Gender.female) {
      femaleCardColor == cardColor
          ? femaleCardColor = inactivecolor
          : femaleCardColor = cardColor;
      maleCardColor = inactivecolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1E33),
        title: const Center(
          child: Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReuseableCard(maleCardColor,
                        const IconContent(FontAwesomeIcons.mars, "Male")),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReuseableCard(femaleCardColor,
                        const IconContent(FontAwesomeIcons.venus, "Female")),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReuseableCard(
                  cardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Height",
                          style: TextStyle(
                              color: Color(0XFF8D8E98), fontSize: 18.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                            ),
                          ),
                          const Text(
                            "CM",
                            style: TextStyle(fontSize: 20.0),
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTickMarkColor: const Color(0XFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0)),
                        child: Slider(
                            value: height.toDouble(),
                            max: 200.0,
                            min: 120.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                      cardColor,
                      Column(
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            "Weight",
                            style: TextStyle(
                                color: Color(0XFF8D8E98), fontSize: 18.0),
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight = weight - 1;
                                    ;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.add,
                                onPressed: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReuseableCard(
                      cardColor,
                      Column(
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            "Age",
                            style: TextStyle(
                                color: Color(0XFF8D8E98), fontSize: 18.0),
                          ),
                          Text(
                            Age.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                onPressed: () {
                                  setState(() {
                                    Age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              RoundedIconButton(
                                onPressed: () {
                                  setState(() {
                                    Age++;
                                  });
                                },
                                icon: FontAwesomeIcons.add,
                              )
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          BottomButton(
              name: "CALCULATE",
              colour: bottomCardColor,
              onTap: () {
                CalculationBMI calc =
                    CalculationBMI(height: height, weigth: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              calculationBMI: calc.calculateBMI(),
                              result: calc.getResult(),
                              interpolation: calc.getInterpolation(),
                            )));
              })
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {required this.onPressed, required this.icon, super.key});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      fillColor: const Color(0XFF4C4F5E),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
