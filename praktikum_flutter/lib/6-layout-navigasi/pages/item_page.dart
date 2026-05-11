import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final String itemName;
  final int price;

  const ItemPage({super.key, required this.itemName, required this.price});

  @override
  Widget build(BuildContext context) {
    final String name =
        ModalRoute.of(context)?.settings.arguments as String? ?? itemName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(name), const Text('Sale with 2000k')],
        ),
      ),
    );
  }
}
