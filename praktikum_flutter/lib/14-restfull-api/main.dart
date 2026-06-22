import 'package:flutter/material.dart';
import 'httphelper.dart';
import '../13-persistensi-data/models/pizza.dart';
import 'pizza_detail.dart';

class PersistDashboard extends StatelessWidget {
  const PersistDashboard({super.key});

  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    return await helper.getPizzaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: FutureBuilder<List<Pizza>>(
        future: callPizzas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final pizzas = snapshot.data!;

          return ListView.builder(
            itemCount: pizzas.length,
            itemBuilder: (BuildContext context, int position) {
              final pizza = pizzas[position];

              return Dismissible(
                key: Key(pizza.id.toString()),

                direction: DismissDirection.endToStart,

                onDismissed: (direction) async {
                  HttpHelper helper = HttpHelper();

                  await helper.deletePizza(pizza.id);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${pizza.pizzaName} deleted')),
                  );
                },

                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),

                child: ListTile(
                  title: Text(pizza.pizzaName),
                  subtitle: Text('${pizza.description} - € ${pizza.price}'),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PizzaDetailScreen(pizza: pizza, isNew: false),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza(
                  id: 0,
                  pizzaName: '',
                  description: '',
                  price: 0,
                  imageUrl: '',
                ),
                isNew: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
