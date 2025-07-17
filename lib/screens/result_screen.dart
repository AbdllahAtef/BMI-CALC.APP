import 'package:bmi_calc/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.bmi,
    required this.result,
    required this.interpretation,
  });

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 1,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0A0E21),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: screenHeight * 0.05,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: Card(
                color: const Color(0xFF1D1E33),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.04,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          color: result.toLowerCase() == 'normal'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        bmi,
                        style: TextStyle(
                          fontSize: screenHeight * 0.09,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenHeight * 0.022,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 250, 42, 42),
        child: BottomButton(
          text: 'Re-Calculate',
          ontab: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
