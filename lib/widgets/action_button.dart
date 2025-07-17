import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.size,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
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
