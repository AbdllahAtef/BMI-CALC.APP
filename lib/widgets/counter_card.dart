import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String text;
  final int value;
  final ValueChanged<int> onChanged;

  const CounterCard({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      child: Card(
        color: const Color(0xFF1D1E33),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: screenHeight * 0.022,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: screenHeight * 0.06,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(
                    icon: Icons.remove,
                    onPressed: () => onChanged(value - 1),
                    size: screenWidth * 0.12,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  _buildActionButton(
                    icon: Icons.add,
                    onPressed: () => onChanged(value + 1),
                    size: screenWidth * 0.12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    required double size,
  }) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: const Color(0xFF4C4F5E),
      child: IconButton(
        icon: Icon(icon, size: size * 0.5),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
