import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/pizza.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({super.key});

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  List<Pizza> myPizzas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    readJsonFile();
  }

  Future<void> readJsonFile() async {
    try {
      String myString = await rootBundle.loadString('assets/pizzalist.json');

      List<dynamic> pizzaMapList = jsonDecode(myString);

      List<Pizza> pizzas = pizzaMapList
          .map((map) => Pizza.fromJson(map))
          .toList();
      String output = jsonEncode(pizzas.map((p) => p.toJson()).toList());

      setState(() {
        myPizzas = pizzas;

        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Parsing'),
        backgroundColor: Colors.blueGrey,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: myPizzas.length,
                    itemBuilder: (context, index) {
                      final pizza = myPizzas[index];
                      return ListTile(
                        leading: const Icon(Icons.local_pizza),
                        title: Text(pizza.pizzaName),
                        subtitle: Text(pizza.description),
                        trailing: Text('\$${pizza.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
