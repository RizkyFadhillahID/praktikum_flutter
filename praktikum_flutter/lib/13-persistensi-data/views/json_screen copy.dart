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

  Future<List<Pizza>> readJsonFile() async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));

      String myString = await rootBundle.loadString('assets/pizzalist.json');
      List<dynamic> pizzaMapList = jsonDecode(myString);

      List<Pizza> pizzas = pizzaMapList
          .map((map) => Pizza.fromJson(map))
          .toList();

      String jsonOutput = convertToJSON(pizzas);
      debugPrint('--- Serialized Pizza List JSON ---');
      debugPrint(jsonOutput);

      setState(() {
        myPizzas = pizzas;
        isLoading = false;
      });
      return pizzas;
    } catch (e) {
      debugPrint('Error reading JSON: $e');
      setState(() {
        isLoading = false;
      });
      return [];
    }
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((p) => p.toJson()).toList());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Parsing - 411253001'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Loading Pizza List...',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )
          : myPizzas.isEmpty
          ? const Center(child: Text('No pizzas found.'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: myPizzas.length,
                itemBuilder: (context, index) {
                  final pizza = myPizzas[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.surface,
                            theme.colorScheme.surfaceVariant.withOpacity(0.3),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.local_pizza,
                            size: 36,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        title: Text(
                          pizza.pizzaName.isEmpty ? 'No Name' : pizza.pizzaName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            pizza.description.isEmpty
                                ? 'No Description'
                                : pizza.description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.secondary.withOpacity(
                                  0.1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '\$${pizza.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'ID: ${pizza.id}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
