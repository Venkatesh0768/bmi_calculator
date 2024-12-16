import 'dart:math';

class CalculationBMI {
  CalculationBMI({required this.height, required this.weigth});

  final int height;
  final int weigth;

  late double _bmi;

  String calculateBMI() {
    _bmi = weigth / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OverWeigth";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpolation() {
    if (_bmi >= 25) {
      return "you have a higher then normal body weight. Try to Execrise More ";
    } else if (_bmi >= 18.5) {
      return "you have a normal body weight. Good Job";
    } else {
      return "you have a Lower then normal body weight. you can eat bit more";
    }
  }
}
