import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.text, required this.ontab});

  final String text;
  final VoidCallback ontab;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: ontab,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.08, 
        color: const Color.fromARGB(255, 250, 42, 42),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.025, 
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
