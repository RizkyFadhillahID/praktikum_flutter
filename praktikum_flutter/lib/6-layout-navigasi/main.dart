import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';
import 'praktikum1-4.dart' as p1_4;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout & Navigasi Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LayoutNavigasiDashboard(),
        '/item': (context) => const ItemPage(itemName: '', price: 0),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class LayoutNavigasiDashboard extends StatelessWidget {
  const LayoutNavigasiDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout & Navigasi - 411253001'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Praktikum Week 6',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.blue.shade50,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => p1_4.MyApp()),
                );
              },
              child: const Text(
                'Praktikum 1-4: Layout Demo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.blue.shade50,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text(
                'Praktikum 5: Shopping List',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
