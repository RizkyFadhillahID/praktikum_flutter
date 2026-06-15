import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen - 411253001'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
              child: const Text('Red', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pop(context, Colors.red.shade700);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade100),
              child: const Text('Green', style: TextStyle(color: Colors.green)),
              onPressed: () {
                Navigator.pop(context, Colors.green.shade700);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade100),
              child: const Text('Blue', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.pop(context, Colors.blue.shade700);
              },
            ),
          ],
        ),
      ),
    );
  }
}
