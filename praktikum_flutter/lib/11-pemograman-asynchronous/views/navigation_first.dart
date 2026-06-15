import 'package:flutter/material.dart';
import './navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.blue.shade700;

  Future<void> _navigateAndGetColor(BuildContext context) async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );
    if (selectedColor is Color) {
      setState(() {
        color = selectedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen - 411253001'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }
}
