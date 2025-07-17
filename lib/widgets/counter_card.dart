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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: const Color(0xFF1D1E33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              '$value',
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xFF4C4F5E),
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.remove),
                      onPressed: () => onChanged(value - 1),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xFF4C4F5E),
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.add),
                      onPressed: () => onChanged(value + 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
