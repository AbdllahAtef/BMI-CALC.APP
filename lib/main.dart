import 'package:bmi_calc/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalc());
}

class BmiCalc extends StatelessWidget {
  const BmiCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home:  BmiCalculatorScreen(),
    );
  }
}
