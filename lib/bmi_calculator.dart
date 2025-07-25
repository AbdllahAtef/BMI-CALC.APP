import 'dart:math';

class BmiCalculator {
  final int height;
  final int weight;

  BmiCalculator({required this.height, required this.weight});

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) return 'OVERWEIGHT';
    if (_bmi > 18.5) return 'NORMAL';
    return 'UNDERWEIGHT';
  }

  String getInterpretation() {
    if (_bmi >= 25) return 'You have a higher than normal body weight.';
    if (_bmi > 18.5) return 'You have a normal body weight. Good job!';
    return 'You have a lower than normal body weight.';
  }
}

