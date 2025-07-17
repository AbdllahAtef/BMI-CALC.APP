import 'package:bmi_calc/bmi_calculator.dart';
import 'package:bmi_calc/screens/result_screen.dart';
import 'package:bmi_calc/widgets/bottom_button.dart';
import 'package:bmi_calc/widgets/counter_card.dart';
import 'package:bmi_calc/widgets/gender_button.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  int height = 170;
  int weight = 85;
  int age = 25;
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenHeight * 0.22;

    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0A0E21),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GenderButton(
                    gender: 'Male',
                    icon: Icons.male,
                    isSelected: selectedGender == 'Male',
                    onTap: () => setState(() => selectedGender = 'Male'),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: GenderButton(
                    gender: 'Female',
                    icon: Icons.female,
                    isSelected: selectedGender == 'Female',
                    onTap: () => setState(() => selectedGender = 'Female'),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.025),
            SizedBox(
              height: cardHeight,
              child: Card(
                color: const Color(0xFF1D1E33),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.04,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: TextStyle(
                              fontSize: screenHeight * 0.06,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: screenHeight * 0.02,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 250,
                        activeColor: Colors.red,
                        inactiveColor: Colors.white,
                        onChanged: (val) =>
                            setState(() => height = val.toInt()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Row(
              children: [
                Expanded(
                  child: CounterCard(
                    text: 'Weight',
                    value: weight,
                    onChanged: (v) => setState(() => weight = v),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: CounterCard(
                    text: 'Age',
                    value: age,
                    onChanged: (v) => setState(() => age = v),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 250, 42, 42),
        child: BottomButton(
          text: 'Calculate',
          ontab: () {
            final calc = BmiCalculator(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ResultScreen(
                  bmi: calc.calculateBMI(),
                  result: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
